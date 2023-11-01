#include "myLib.h"
#include "sound.h"

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundL( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundL.data = sound;
        soundL.length = length;
        soundL.frequency = SOUND_FREQ;
        soundL.isPlaying = 1;
        soundL.loops = loops;
        soundL.duration = ((VBLANK_FREQ*length)/SOUND_FREQ);  
        soundL.vBlankCount = 0;

}

void playSoundG( const signed char* sound, int length, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundG.data = sound;
  		soundG.length = length;
        soundG.frequency = SOUND_FREQ;
        soundG.isPlaying = 1;
        soundG.loops = loops;
        soundG.duration = ((VBLANK_FREQ*length)/SOUND_FREQ);  
        soundG.vBlankCount = 0;

}


void setupInterrupts()
{
    REG_IME = 0; 

	REG_INTERRUPT = (unsigned int) interruptHandler;


    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if(REG_IF & INT_VBLANK) {
        if (soundL.isPlaying) {

			soundL.vBlankCount++;
			if (soundL.vBlankCount > soundL.duration) {
				 if (soundL.loops) {
                    playSoundL(soundL.data, soundL.length, soundL.loops);
                } else {
                    dma[1].cnt = 0;
                    soundL.isPlaying = 0;
                    REG_TM0CNT = 0;

                }
			}
        }

        if (soundG.isPlaying) {

       		soundG.vBlankCount++;
           		if (soundG.vBlankCount > soundG.duration) {
                	if (soundG.loops) {
                    	playSoundG(soundG.data, soundG.length, soundG.loops);
                	} else {
                    	dma[2].cnt = 0;
                    	soundG.isPlaying = 0;
                    	REG_TM1CNT = 0;

                }
            }
        }        

        REG_IF = INT_VBLANK;
    }

    REG_IME = 1;
}

void pauseSound() {

	soundL.isPlaying = 0;
	REG_TM0CNT = 0;

	soundG.isPlaying = 0;
	REG_TM1CNT = 0;

}

void unpauseSound() {

	soundL.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;

	soundG.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;

}

void stopSound() {

	dma[1].cnt = 0;
    dma[2].cnt = 0;
	soundL.isPlaying = 0;
	REG_TM0CNT = 0;
	soundG.isPlaying = 0;
	REG_TM1CNT = 0;

}