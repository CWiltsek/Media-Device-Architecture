
//{{BLOCK(background)

//======================================================================
//
//	background, 512x256@4, 
//	+ palette 16 entries, not compressed
//	+ 167 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 32 + 5344 + 4096 = 9472
//
//	Time-stamp: 2020-04-27, 14:05:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 5344
extern const unsigned short backgroundTiles[2672];

#define backgroundMapLen 4096
extern const unsigned short backgroundMap[2048];

#define backgroundPalLen 32
extern const unsigned short backgroundPal[16];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
