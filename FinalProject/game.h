// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define BULLETCOUNT 50
#define ENEMYBULLETCOUNT 20
#define BOSSHEALTHREMAINING 10
#define PLAYERHEALTHREMAINING 1
#define GRAVITY 100
#define JUMPPOWER 1500


// Variables
extern int hOff;
extern int vOff;
extern int playerHealthRemaining;
extern int bossHealthRemaining;
extern int boss2HealthRemaining;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern SPRITE boss;
extern SPRITE boss2;
extern BULLET bullets[BULLETCOUNT];
extern ENEMYBULLET enemybullets[ENEMYBULLETCOUNT];
extern int screenBlock;


// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
// bool isCollision(int pos);
// int willCollidie();

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