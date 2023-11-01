# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];
# 4 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdbool.h" 1 3 4
# 6 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 46 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 60 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;


typedef __builtin_va_list __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 80 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 186 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 266 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 396 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 577 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 7 "game.c" 2
# 1 "laserSound.h" 1





# 5 "laserSound.h"
extern const signed char laserSound[4605];
# 8 "game.c" 2
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
# 9 "game.c" 2


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
BULLET bullets[50];
ENEMYBULLET enemybullets[20];


enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};
enum {BOSSFRONT, BOSSBACK, BOSSRIGHT, BOSSLEFT, BOSSIDLE};

int playerHealthRemaining;
int bossHealthRemaining;
int boss2HealthRemaining;


void initGame() {


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

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);

    initPlayer();

    initBoss();
    initBoss2();

    initBullets();

    initEnemyBullets();

    initObstacles();

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


void updateGame() {

 updatePlayer();
    updateBoss();
    updateBoss2();
    updateObstacles();
 for (int i = 0; i < 50; i++) {
  updateBullets(&bullets[i]);
 }
 for (int i = 0; i < 20; i++) {
  updateEnemyBullets(&enemybullets[i]);
 }
 if (boss.bulletTimer % 60 == 0) {
  fireEnemyBullets();
  boss.bulletTimer = 0;
 }
 boss.bulletTimer++;

}


void drawGame() {
    if (hOff > 256) {
        screenBlock++;
        hOff -= 256;
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<14) | (0<<7);
    }
    if (playerHOff > 512) {
        playerHOff -= 512;
    }
    drawPlayer();
    drawBoss();
    drawBoss2();
    drawObstacles();
 for (int i = 0; i < 50; i++) {
  drawBullets(&bullets[i]);
 }
 for (int i = 0; i < 20; i++) {
  drawEnemyBullets(&enemybullets[i]);
 }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    waitForVBlank();

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}


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




# 136 "game.c" 3 4
_Bool 
# 136 "game.c"
    isCollision(int pos) {
    return !(collisionmapBitmap[((player.worldRow + pos + player.height)*(512)+(player.worldCol + player.width - 1))]
        && collisionmapBitmap[((player.worldRow + pos + player.height)*(512)+(player.worldCol))]);
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

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !amJumping) {
        player.rdel -= jumpForce;
        amJumping = 1;
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (collisionmapBitmap[(((player.worldRow % 256))*(512)+((player.worldCol - player.cdel) % 512))]
            && collisionmapBitmap[(((player.worldRow + player.height - 1) % 256)*(512)+((player.worldCol - player.cdel) % 512))]) {

            player.worldCol -= 2;

            if (playerHOff > 0 && player.screenCol < 240 / 3) {
                hOff -= 2;
                playerHOff -= 2;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (collisionmapBitmap[(((player.worldRow))*(512)+((player.worldCol + player.width + player.cdel - 1)))]
            && collisionmapBitmap[(((player.worldRow + player.height - 1))*(512)+((player.worldCol + player.width + player.cdel - 1)))]) {


            player.worldCol += 2;

            if (player.screenCol > 240 / 3 && screenBlock < 31 && player.worldCol < 512 - 200) {
                hOff += 2;
                playerHOff += 2;
            }
            }
    }

 if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        playSoundL(laserSound, 4605, 0);
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

    for (int i = 0; i < 20; i++) {
     if (enemybullets[i].active && collision(player.screenCol, player.screenRow, player.width, player.height,
      enemybullets[i].col, enemybullets[i].row, enemybullets[i].width, enemybullets[i].height)) {
            playerHealthRemaining--;
            enemybullets[i].active = 0;
            enemybullets[i].erased = 1;
         shadowOAM[enemybullets[i].index].attr0 = (2<<8);
     }
    }

    if (cheatCounter > 9) {
        jumpForce = 20;
    }

    animatePlayer();
}

int j = 0;


void animatePlayer() {


    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;


    if (player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) || (~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
    if (j % 2 == 0) {
        player.aniState = PLAYERFRONT;
    } else {
        player.aniState = PLAYERBACK;
    }
    }

    j++;


    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}


void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & player.screenRow) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (1<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((player.aniState * 2)*32+(0));
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
        shadowOAM[1].attr0 |= (2<<8);
    } else {
        shadowOAM[1].attr0 = (0xFF & boss.screenRow) | (0<<14);
        shadowOAM[1].attr1 = (0x1FF & boss.screenCol) | (1<<14);
        shadowOAM[1].attr2 = ((0)<<12) | ((boss.aniState * 2)*32+(6));
    }
}

int i = 0;
int up = 0;

void updateBoss() {
    boss.screenCol = boss.worldCol - playerHOff;
    boss.screenRow = boss.worldRow - vOff;
    for (int i = 0; i < 50; i++) {
        if (bullets[i].active) {
            if (collision(boss.screenCol, boss.screenRow, boss.width, boss.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss.hide) {
                bossHealthRemaining--;
                bullets[i].active = 0;
                bullets[i].erased = 1;
             shadowOAM[bullets[i].index].attr0 = (2<<8);
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


void animateBoss() {


    boss.prevAniState = boss.aniState;
    boss.aniState = BOSSIDLE;


    if (boss.aniCounter % 20 == 0) {
        boss.curFrame = (boss.curFrame + 1) % boss.numFrames;
    }


    if (j % 15 == 0) {
        boss.aniState = BOSSFRONT;
    }
    if (j % 7 == 0) {
        boss.aniState = BOSSBACK;
    }


    if (boss.aniState == BOSSIDLE) {
        boss.curFrame = 0;
        boss.aniCounter = 0;
        boss.aniState = boss.prevAniState;
    } else {
        boss.aniCounter++;
    }
}

void initBullets() {
   for (int i = 0; i < 50; i++) {
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


void updateBullets(BULLET* b) {
 if (b->active) {
  if (b->col + b->cdel > 0
            && b->col + b->cdel + hOff < player.worldCol + 240
            && collisionmapBitmap[((b->row)*(512)+(b->col + b->width + b->cdel - 1))]) {
            b->col += b->cdel;
  } else {
   b->active = 0;
  }
 }
}


void drawBullets(BULLET* b) {
 if (b->active) {
  shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
  shadowOAM[b->index].attr1 = (b->col) | (1<<14);
     shadowOAM[b->index].attr2 = ((0)*32+(2)) | ((0)<<12);
 } else if (!b->erased) {
  shadowOAM[b->index].attr0 = (2<<8);
 }
}


void fireBullet() {
 for (int i = 0; i < 50; i++) {
  if (!bullets[i].active) {
   bullets[i].row = player.worldRow - vOff;
   bullets[i].col = player.worldCol - playerHOff;
   bullets[i].active = 1;
   bullets[i].erased = 0;
   break;
  }
 }
}


void initEnemyBullets() {
 for (int i = 0; i < 20; i++) {
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
            && b->col + b->cdel < 240 - 1
            && collisionmapBitmap[((b->row)*(0)+(b->col - b->cdel - 1))]) {

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
  shadowOAM[b->index].attr0 = (b->row) | (0<<13) | (0<<14);
  shadowOAM[b->index].attr1 = (b->col) | (1<<14);
  shadowOAM[b->index].attr2 = ((0)<<12)| ((0)*32+(2));
 } else {
  shadowOAM[b->index].attr0 = (2<<8);
 }
}

void fireEnemyBullets() {
  for (int i = 0; i < 20; i++) {
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
        shadowOAM[2].attr0 |= (2<<8);
    } else {
        shadowOAM[2].attr0 = (0xFF & obstacle.screenRow) | (0<<14);
        shadowOAM[2].attr1 = (0x1FF & obstacle.screenCol) | (1<<14);
        shadowOAM[2].attr2 = ((0)<<12) | ((0)*32+(8));
    }
}

void updateObstacles(){
    obstacle.screenRow = obstacle.worldRow - vOff;
    obstacle.screenCol = obstacle.worldCol - playerHOff;
    for (int i = 0; i < 50; i++) {
        if (bullets[i].active) {
            if (collision(obstacle.screenCol, obstacle.screenRow, obstacle.width, obstacle.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss.hide) {
                cheatCounter++;
                bullets[i].active = 0;
                bullets[i].erased = 1;
             shadowOAM[bullets[i].index].attr0 = (2<<8);
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
        shadowOAM[3].attr0 |= (2<<8);
    } else {
        shadowOAM[3].attr0 = (0xFF & boss2.screenRow) | (0<<14);
        shadowOAM[3].attr1 = (0x1FF & boss2.screenCol) | (1<<14);
        shadowOAM[3].attr2 = ((0)<<12) | ((0)*32+(4));
    }
}

void updateBoss2() {
    boss2.screenCol = boss2.worldCol - playerHOff;
    boss2.screenRow = boss2.worldRow - vOff;
    for (int i = 0; i < 50; i++) {
        if (bullets[i].active) {
            if (collision(boss2.screenCol, boss2.screenRow, boss2.width, boss2.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height) && !boss2.hide) {
                boss2HealthRemaining--;
                bullets[i].active = 0;
                bullets[i].erased = 1;
             shadowOAM[bullets[i].index].attr0 = (2<<8);
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
