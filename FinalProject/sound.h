SOUND soundL;
SOUND soundG;

#define SOUND_FREQ 11025

void setupSounds();
void playSoundL(const signed char* sound, int length, int loops);
void playSoundG(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
