# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 76 "myLib.h"
extern unsigned short *videoBuffer;
# 97 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 169 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int health;
} ANISPRITE;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int hide;
    int health;
    int bulletTimer;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} SPRITE;


typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rdel;
 int cdel;
 int height;
 int width;
 int active;
 int erased;
 int index;
} BULLET;


typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rdel;
 int cdel;
 int height;
 int width;
 int active;
 int erased;
 int index;
} ENEMYBULLET;
# 262 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 273 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 313 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 354 "myLib.h"
typedef void (*ihp)(void);
# 409 "myLib.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "sound.c" 2
# 1 "sound.h" 1
SOUND soundL;
SOUND soundG;



void setupSounds();
void playSoundL(const signed char* sound, int length, int loops);
void playSoundG(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 3 "sound.c" 2

void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSoundL( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundL.data = sound;
        soundL.length = length;
        soundL.frequency = 11025;
        soundL.isPlaying = 1;
        soundL.loops = loops;
        soundL.duration = (((59.727)*length)/11025);
        soundL.vBlankCount = 0;

}

void playSoundG( const signed char* sound, int length, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundG.data = sound;
    soundG.length = length;
        soundG.frequency = 11025;
        soundG.isPlaying = 1;
        soundG.loops = loops;
        soundG.duration = (((59.727)*length)/11025);
        soundG.vBlankCount = 0;

}


void setupInterrupts()
{
    *(unsigned short*)0x4000208 = 0;

 *((ihp*)0x03007FFC) = (unsigned int) interruptHandler;


    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

    *(unsigned short*)0x4000208 = 0;

    if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundL.isPlaying) {

   soundL.vBlankCount++;
   if (soundL.vBlankCount > soundL.duration) {
     if (soundL.loops) {
                    playSoundL(soundL.data, soundL.length, soundL.loops);
                } else {
                    dma[1].cnt = 0;
                    soundL.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;

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
                     *(volatile unsigned short*)0x4000106 = 0;

                }
            }
        }

        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }

    *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {

 soundL.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;

 soundG.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}

void unpauseSound() {

 soundL.isPlaying = 1;
 *(volatile unsigned short*)0x4000102 = (1<<7);

 soundG.isPlaying = 1;
 *(volatile unsigned short*)0x4000106 = (1<<7);

}

void stopSound() {

 dma[1].cnt = 0;
    dma[2].cnt = 0;
 soundL.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 soundG.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}
