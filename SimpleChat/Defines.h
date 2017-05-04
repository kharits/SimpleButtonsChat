//
//  Defines.h
//  TestInstApp
//
//  Created by kharitserg on 08.12.16.
//  Copyright © 2016 DigitalZone. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define IPAD     UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#endif /* Defines_h */
