
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "background.h"
#include "winScreen.h"
#include "pauseScreen.h"
#include "loseScreen.h"
#include "startScreen.h"
#include "instructionScreen.h"
#include "laserSound.h"
#include "sound.h"
#include "gameMusic.h"

// Prototypes
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

// States
enum {START, GAME, INSTRUCTION, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
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

// Sets up GBA
void initialize() {

    screenBlock = 28;

    // Set up the display
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | BG_4BPP;

    // Set up the first state
    goToStart();

    setupSounds();
    setupInterrupts();

}

void startState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundG(gameMusic, GAMEMUSICLEN, 1);
        initGame();
        goToGame();        
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstruction();
    }
}

void goToStart() {

    DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen / 2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
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

// Sets up the game state
void goToGame() {

    // Make sure changes do not appear onscreen
    waitForVBlank();
    

    // Set up the background background
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[screenBlock], backgroundMapLen / 2);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;



    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    

    state = GAME;
}

void instructionState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToInstruction() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, instructionScreenPal, PALETTE, instructionScreenPalLen/2);
    DMANow(3, instructionScreenTiles, &CHARBLOCK[0], instructionScreenTilesLen/2);
    DMANow(3, instructionScreenMap, &SCREENBLOCK[screenBlock], instructionScreenMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    state = INSTRUCTION;    
}

void pauseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    }
}

void goToPause() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, pauseScreenPal, PALETTE, pauseScreenPalLen/2);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[screenBlock], pauseScreenMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    state = PAUSE;
}

void winState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}

void goToWin() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, winScreenPal, PALETTE, winScreenPalLen/2);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[screenBlock], winScreenMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    state = WIN;  
}

void loseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}

void goToLose() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, loseScreenPal, PALETTE, loseScreenPalLen/2);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[screenBlock], loseScreenMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    state = LOSE;
}
