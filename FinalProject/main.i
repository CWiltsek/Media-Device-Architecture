# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

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
# 3 "main.c" 2
# 1 "game.h" 1
# 13 "game.h"
extern int hOff;
extern int vOff;
extern int playerHealthRemaining;
extern int bossHealthRemaining;
extern int boss2HealthRemaining;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern SPRITE boss;
extern SPRITE boss2;
extern BULLET bullets[50];
extern ENEMYBULLET enemybullets[20];
extern int screenBlock;



void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();



void initBoss();
void updateBoss();
void drawBoss();
void animateBoss();
void initBoss2();
void updateBoss2();
void drawBoss2();

void initBullets();
void updateBullets(BULLET *);
void drawBullets(BULLET *);
void fireBullet();

void initEnemyBullets();
void updateEnemyBullets(ENEMYBULLET *);
void drawEnemyBullets(ENEMYBULLET *);
void fireEnemyBullets();

void initObstacles();
void drawObstacles();
void updateObstacles();
# 4 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[2672];


extern const unsigned short backgroundMap[2048];


extern const unsigned short backgroundPal[16];
# 6 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[800];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 7 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[1856];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 8 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[800];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 9 "main.c" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[3072];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];
# 10 "main.c" 2
# 1 "instructionScreen.h" 1
# 22 "instructionScreen.h"
extern const unsigned short instructionScreenTiles[1280];


extern const unsigned short instructionScreenMap[1024];


extern const unsigned short instructionScreenPal[256];
# 11 "main.c" 2
# 1 "laserSound.h" 1




extern const signed char laserSound[4605];
# 12 "main.c" 2
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
# 13 "main.c" 2
# 1 "gameMusic.h" 1




extern const signed char gameMusic[74156];
# 14 "main.c" 2


void initialize();
void goToGame();
void gameState();
void goToStart();
void startState();
void goToPause();
void pauseState();
void goToInstruction();
void instructionState();
void goToWin();
void winState();
void goToLose();
void loseState();


enum {START, GAME, INSTRUCTION, PAUSE, WIN, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {

            case START:
                startState();
                break;
            case GAME:
                gameState();
                break;
            case INSTRUCTION:
                instructionState();
                break;
            case PAUSE:
                pauseState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
            default:
                break;
        }

    }
}


void initialize() {

    screenBlock = 28;


    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<14) | (0<<7);


    goToStart();

    setupSounds();
    setupInterrupts();

}

void startState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundG(gameMusic, 74156, 1);
        initGame();
        goToGame();
    } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToInstruction();
    }
}

void goToStart() {

    DMANow(3, startScreenPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, startScreenTiles, &((charblock *)0x6000000)[0], 6144 / 2);
    DMANow(3, startScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSound();
        goToPause();
    }
    if (bossHealthRemaining == 0 && boss2HealthRemaining == 0) {
        stopSound();
        goToWin();
    } else if (playerHealthRemaining == 0) {
        stopSound();
        goToLose();
    }
}


void goToGame() {


    waitForVBlank();



    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 32);
    DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 5344 / 2);
    DMANow(3, backgroundMap, &((screenblock *)0x6000000)[screenBlock], 4096 / 2);

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;



    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    state = GAME;
}

void instructionState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToInstruction() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, instructionScreenPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, instructionScreenTiles, &((charblock *)0x6000000)[0], 2560/2);
    DMANow(3, instructionScreenMap, &((screenblock *)0x6000000)[screenBlock], 2048/2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    state = INSTRUCTION;
}

void pauseState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        unpauseSound();
        goToGame();
    }
}

void goToPause() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 3712/2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[screenBlock], 2048/2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    state = PAUSE;
}

void winState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}

void goToWin() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, winScreenPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, winScreenTiles, &((charblock *)0x6000000)[0], 1600/2);
    DMANow(3, winScreenMap, &((screenblock *)0x6000000)[screenBlock], 2048/2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    state = WIN;
}

void loseState() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}

void goToLose() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, loseScreenPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, loseScreenTiles, &((charblock *)0x6000000)[0], 1600/2);
    DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[screenBlock], 2048/2);

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    state = LOSE;
}
