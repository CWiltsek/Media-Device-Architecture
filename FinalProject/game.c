#include "myLib.h"
#include "game.h"
#include "collisionmap.h"
#include "spritesheet.h"
#include <stdbool.h>
#include <stdio.h>
#include "laserSound.h"
#include "sound.h"

// Variables
int hOff;
int vOff;
int screenBlock;
int playerHOff;
int amJumping;
int cheatCounter;
int jumpForce;

OBJ_ATTR shadowOAM[128];
ANISPRITE player;
SPRITE boss;
SPRITE boss2;
SPRITE obstacle;
BULLET bullets[BULLETCOUNT];
ENEMYBULLET enemybullets[ENEMYBULLETCOUNT];

// player animation states for aniState
enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};
enum {BOSSFRONT, BOSSBACK, BOSSRIGHT, BOSSLEFT, BOSSIDLE};

int playerHealthRemaining;
int bossHealthRemaining;
int boss2HealthRemaining;

// Initialize the game
void initGame() {

	// Place screen on map
    vOff = 80;
    hOff = 10;
    screenBlock = 28;
    playerHOff = 0;

    jumpForce = 15;
    cheatCounter = 0;
    amJumping = 0;

    playerHealthRemaining = 1;
    bossHealthRemaining = 5;
    boss2HealthRemaining = 3;

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);    

    initPlayer();

    initBoss();
    initBoss2();

    initBullets();

    initEnemyBullets();

    initObstacles();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Updates the game each frame
void updateGame() {

	updatePlayer();
    updateBoss();
    updateBoss2();
    updateObstacles();
	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullets(&bullets[i]);
	}
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		updateEnemyBullets(&enemybullets[i]);
	}
	if (boss.bulletTimer % 60 == 0) {
		fireEnemyBullets();
		boss.bulletTimer = 0;
	}
	boss.bulletTimer++;    

}

// Draws the game each frame
void drawGame() {
    if (hOff > 256) {
        screenBlock++;
        hOff -= 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    }
    if (playerHOff > 512) {
        playerHOff -= 512;
    }
    drawPlayer();
    drawBoss();
    drawBoss2();
    drawObstacles();
	for (int i = 0; i < BULLETCOUNT; i++) {
		drawBullets(&bullets[i]);
	}
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		drawEnemyBullets(&enemybullets[i]);
	}
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

// Initialize the player
void initPlayer() {

    player.width = 16;
    player.height = 16;
    player.rdel = 5;
    player.cdel = 1;
    player.health = playerHealthRemaining;
    player.worldRow = 190;
    player.worldCol = 10;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PLAYERFRONT;
}

// Handle every-frame actions of the player

bool isCollision(int pos) {
    return !(collisionmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + pos + player.height, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(player.worldCol, player.worldRow + pos + player.height, MAPWIDTH)]);
}

int willCollide() {
    for(int i = 0; i < player.rdel; i++) {
        if (isCollision(i)) {
            return i;
        }
    }
    return -1;
}

void updatePlayer() {

    if (willCollide() == -1) {
        player.worldRow += player.rdel;
    } else {
        player.worldRow += willCollide();
        player.rdel = 5;
        amJumping = 0; 
    }

    if (amJumping) {
        player.rdel += 1;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && !amJumping) {
        player.rdel -= jumpForce;
        amJumping = 1;
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (collisionmapBitmap[OFFSET((player.worldCol - player.cdel) % MAPWIDTH, (player.worldRow % MAPHEIGHT), MAPWIDTH)]
            && collisionmapBitmap[OFFSET((player.worldCol - player.cdel) % MAPWIDTH, (player.worldRow + player.height - 1) % MAPHEIGHT, MAPWIDTH)]) {

            player.worldCol -= 2;

            if (playerHOff > 0 && player.screenCol < SCREENWIDTH / 3) {
                hOff -= 2;
                playerHOff -= 2;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (collisionmapBitmap[OFFSET((player.worldCol + player.width + player.cdel - 1), (player.worldRow), MAPWIDTH)]
            && collisionmapBitmap[OFFSET((player.worldCol + player.width + player.cdel - 1), (player.worldRow + player.height - 1), MAPWIDTH)]) {

            // Update player's world position if the above is true
            player.worldCol += 2;

            if (player.screenCol > SCREENWIDTH / 3 && screenBlock < 31 && player.worldCol < MAPWIDTH - 200) {
                hOff += 2;
                playerHOff += 2;
            }
            }
    }

	if (BUTTON_PRESSED(BUTTON_A)) {
        playSoundL(laserSound, LASERSOUNDLEN, 0);
		fireBullet();
	}

    player.screenCol = player.worldCol - playerHOff;
    player.screenRow = player.worldRow - vOff;

    if (collision(boss.screenCol, boss.screenRow, boss.width, boss.height, player.screenCol, player.screenRow, player.width, player.height) && !boss.hide) {
        playerHealthRemaining--;
    }

    if (collision(boss2.screenCol, boss2.screenRow, boss2.width, boss2.height, player.screenCol, player.screenRow, player.width, player.height) && !boss2.hide) {
        playerHealthRemaining--;
    }    

    if (collision(obstacle.screenCol, obstacle.screenRow, obstacle.width, obstacle.height, player.screenCol, player.screenRow, player.width, player.height)) {
        playerHealthRemaining--;
    }    

    for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
    	if (enemybullets[i].active && collision(player.screenCol, player.screenRow, player.width, player.height,
    		enemybullets[i].col, enemybullets[i].row, enemybullets[i].width, enemybullets[i].height)) {
            playerHealthRemaining--;
            enemybullets[i].active = 0;
            enemybullets[i].erased = 1;
        	shadowOAM[enemybullets[i].index].attr0 = ATTR0_HIDE;            
    	}
    }

    if (cheatCounter > 9) {
        jumpForce = 20;
    }

    animatePlayer();
}

int j = 0;

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    // Change the animation frame every 20 frames of gameplay
    if (player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state
    if (BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
    if (j % 2 == 0) {
        player.aniState = PLAYERFRONT;
    } else {
        player.aniState = PLAYERBACK;
    }
    }

    j++;

    // If the player aniState is idle, frame is player standing
    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, player.aniState * 2);
    }
}

void initBoss() {
    boss.aniState = BOSSFRONT;
    boss.width = 24;
    boss.height = 24;
    boss.rdel = 1;
    boss.cdel = 1;
    boss.worldRow = 110;
    boss.worldCol = 200;
    boss.health = bossHealthRemaining;
}

void drawBoss() {
    if (boss.hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[1].attr0 = (ROWMASK & boss.screenRow) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & boss.screenCol) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, boss.aniState * 2);
    }    
}

int i = 0;
int up = 0;

void updateBoss() {
    boss.screenCol = boss.worldCol - playerHOff;
    boss.screenRow = boss.worldRow - vOff;
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active) {
            if (collision(boss.screenCol, boss.screenRow, boss.width, boss.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss.hide) {
                bossHealthRemaining--;
                bullets[i].active = 0;
                bullets[i].erased = 1;
            	shadowOAM[bullets[i].index].attr0 = ATTR0_HIDE;
            }
        }
    }
    if (bossHealthRemaining == 0) {
        boss.hide = 1;
    } else {
        boss.hide = 0;
    }
    if (i < 30 && up) {
        i++;
        boss.worldRow++;
    } else {
        up = 0;
    }
    if (i > 0 && !up) {
        i--;
        boss.worldRow--;
    } else {
        up = 1;
    }

    animateBoss();
}

// Handle player animation states
void animateBoss() {

    // Set previous state to current state
    boss.prevAniState = boss.aniState;
    boss.aniState = BOSSIDLE;

    // Change the animation frame every 20 frames of gameplay
    if (boss.aniCounter % 20 == 0) {
        boss.curFrame = (boss.curFrame + 1) % boss.numFrames;
    }

    // Control movement and change animation state
    if (j % 15 == 0) {
        boss.aniState = BOSSFRONT;
    }
    if (j % 7 == 0) {
        boss.aniState = BOSSBACK;
    }

    // If the boss aniState is idle, frame is boss standing
    if (boss.aniState == BOSSIDLE) {
        boss.curFrame = 0;
        boss.aniCounter = 0;
        boss.aniState = boss.prevAniState;
    } else {
        boss.aniCounter++;
    }
}

void initBullets() {
   for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].row = player.worldRow - vOff;
        bullets[i].col = player.worldCol - playerHOff;
        bullets[i].height = 6;
        bullets[i].width = 6;
        bullets[i].rdel = 2;
        bullets[i].cdel = 2;
        bullets[i].active = 0;
        bullets[i].index = i + 51;
    }
}

// Update player's bullets here so they move towards enemies
void updateBullets(BULLET* b) {
	if (b->active) {
		if (b->col + b->cdel > 0
            && b->col + b->cdel + hOff < player.worldCol + SCREENWIDTH
            && collisionmapBitmap[OFFSET(b->col + b->width + b->cdel - 1, b->row, MAPWIDTH)]) {
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

// We shadowOAM player's bullets here
void drawBullets(BULLET* b) {
	if (b->active) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_SMALL;
	   	shadowOAM[b->index].attr2 =  ATTR2_TILEID(2, 0) | ATTR2_PALROW(0);
	} else if (!b->erased) {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Find the first inactive bullet, initialize it, and set it active
void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			bullets[i].row = player.worldRow - vOff;
			bullets[i].col = player.worldCol - playerHOff;
			bullets[i].active = 1;
			bullets[i].erased = 0;
			break;
		}
	}
}

// Initialize the enemy bullets
void initEnemyBullets() {
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		enemybullets[i].height = 6; 
		enemybullets[i].width = 6;   
		enemybullets[i].row = boss.worldRow - vOff;
		enemybullets[i].col = boss.worldCol - playerHOff;
		enemybullets[i].rdel = 2;
        enemybullets[i].cdel = 2;
		enemybullets[i].active = 0;
		enemybullets[i].index = i + 30; 
	}
}

void updateEnemyBullets(ENEMYBULLET* b) {
	if (b->active && !boss.hide) {
		if (b->col - b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH - 1
            && collisionmapBitmap[OFFSET(b->col - b->cdel - 1, b->row, 0)]) {

            b->col -= b->cdel;
		} else {
			b->active = 0;
		}
	} else {
        b->active = 0;
    }
}

void drawEnemyBullets(ENEMYBULLET* b) {
	if(b->active && !boss.hide) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_SMALL;
		shadowOAM[b->index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(2, 0);
	} else {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

void fireEnemyBullets() {
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			if (!enemybullets[i].active && !boss.hide) {
				enemybullets[i].row = boss.worldRow - vOff;
				enemybullets[i].col = boss.worldCol - playerHOff;
				enemybullets[i].active = 1;
				break;
			}
		}
}

void initObstacles() {
    obstacle.width = 10;
    obstacle.height = 10;
    obstacle.rdel = 1;
    obstacle.cdel = 1;
    obstacle.worldRow = 192;
    obstacle.worldCol = 200;
}

void drawObstacles() {
    if (obstacle.hide) {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[2].attr0 = (ROWMASK & obstacle.screenRow) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & obstacle.screenCol) | ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
    }   
}

void updateObstacles(){
    obstacle.screenRow = obstacle.worldRow - vOff;
    obstacle.screenCol = obstacle.worldCol - playerHOff;    
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active) {
            if (collision(obstacle.screenCol, obstacle.screenRow, obstacle.width, obstacle.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss.hide) {
                cheatCounter++;
                bullets[i].active = 0;
                bullets[i].erased = 1;
            	shadowOAM[bullets[i].index].attr0 = ATTR0_HIDE;
            }
        }
    }
}

void initBoss2() {
    boss2.width = 24;
    boss2.height = 24;
    boss2.rdel = 1;
    boss2.cdel = 1;
    boss2.worldRow = 100;
    boss2.worldCol = 450;
    boss2.health = boss2HealthRemaining;
}

void drawBoss2() {
    if (boss2.hide) {
        shadowOAM[3].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[3].attr0 = (ROWMASK & boss2.screenRow) | ATTR0_SQUARE;
        shadowOAM[3].attr1 = (COLMASK & boss2.screenCol) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
    }    
}

void updateBoss2() {
    boss2.screenCol = boss2.worldCol - playerHOff;
    boss2.screenRow = boss2.worldRow - vOff;
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (bullets[i].active) {
            if (collision(boss2.screenCol, boss2.screenRow, boss2.width, boss2.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss2.hide) {
                boss2HealthRemaining--;
                bullets[i].active = 0;
                bullets[i].erased = 1;
            	shadowOAM[bullets[i].index].attr0 = ATTR0_HIDE;
            }
        }
    }
    if (boss2HealthRemaining == 0) {
        boss2.hide = 1;
    } else {
        boss2.hide = 0;
    }
    if (bossHealthRemaining == 0) {
    if (boss2.worldCol < player.worldCol) {
        boss2.worldCol++;
    } else {
        boss2.worldCol--;
    }
    if (boss2.worldRow < player.worldRow) {
        boss2.worldRow++;
    } else {
        boss2.worldRow--;
    }
    }
}