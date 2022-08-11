//
//  Utility.h
//  DecoderApp1
//
//  Created by ngan on 2022/08/09.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject

@end

//////////////////////////////////////////////////////////////////
// Debug/Release
//////////////////////////////////////////////////////////////////

#ifdef DEBUG
// Debug Mode
//...

#else
// Release Mode
//...

// Clean NSLog
#define NSLog(...) {};

#endif

#ifdef DEBUG
#define FUNC_LOG() (NSLog(@"%s", __PRETTY_FUNCTION__))
#else
#define FUNC_LOG()                                                                                                                         \
    {}
#endif

//////////////////////////////////////////////////////////////////
// Simulator/Device
//////////////////////////////////////////////////////////////////

#if TARGET_OS_IPHONE
// iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
// iPhone Simulator
#endif

//////////////////////////////////////////////////////////////////
// ARC/no ARC
//////////////////////////////////////////////////////////////////

#if __has_feature(objc_arc)
// compiling with ARC
#else
// compiling without ARC
#endif

//////////////////////////////////////////////////////////////////
// Abbreviation
//////////////////////////////////////////////////////////////////

//#define UserDefaults        [NSUserDefaults standardUserDefaults]
//#define SharedApplication   [UIApplication sharedApplication]
//#define MainBundle          [NSBundle mainBundle]
//#define MainScreen          [UIScreen mainScreen]

//////////////////////////////////////////////////////////////////
// UI
//////////////////////////////////////////////////////////////////

//#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
//#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height

//////////////////////////////////////////////////////////////////
// System
//////////////////////////////////////////////////////////////////
//
//#define SystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
//
//#define IsRetina ([[UIScreen mainScreen] scale]==2)
//#define IsiPhone5 ([UIScreen
// instancesRespondToSelector:@selector(currentMode)] ?
// CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen]
// currentMode].size) : NO) #define IsiPad (UI_USER_INTERFACE_IDIOM() ==
// UIUserInterfaceIdiomPad) #define IsAfterIOS4 ([[[UIDevice currentDevice]
// systemVersion] intValue]>4) #define IsAfterIOS5 ([[[UIDevice currentDevice]
// systemVersion] intValue]>5) #define IsAfterIOS6 ([[[UIDevice currentDevice]
// systemVersion] intValue]>6)
//
//#define AppName [[[NSBundle mainBundle] infoDictionary]
// objectForKey:@"CFBundleName"];
//////////////////////////////////////////////////////////////////
// CGRect
//////////////////////////////////////////////////////////////////

#define SetX(v, x)              v = CGRectMake(x, v.origin.y, v.size.width, v.size.height)
#define SetY(v, y)              v = CGRectMake(v.origin.x, y, v.size.width, v.size.height)
#define SetWidth(v, w)          v = CGRectMake(v.origin.x, v.origin.y, w, v.size.height)
#define SetHeight(v, h)         v = CGRectMake(v.origin.x, v.origin.y, v.size.width, h)
#define SetOrigin(v, x, y)      v = CGRectMake(x, y, v.size.width, v.size.height)
#define SetSize(v, w, h)        v = CGRectMake(v.origin.x, v.origin.y, w, h)
#define SetFrame(v, x, y, w, h) v = CGRectMake(x, y, w, h)
#define AddX(v, offset)         v = CGRectMake(v.origin.x + offset, v.origin.y, v.size.width, v.size.height)
#define AddY(v, offset)         v = CGRectMake(v.origin.x, v.origin.y + offset, v.size.width, v.size.height)

#define X(v)      v.frame.origin.x
#define Y(v)      v.frame.origin.y
#define Width(v)  v.frame.size.width
#define Height(v) v.frame.size.height
#define Origin(v) v.frame.origin
#define Size(v)   v.frame.size

#define FLIP_Y(yPos, objHeight, parentHeight) (parentHeight - objHeight - yPos)

//////////////////////////////////////////////////////////////////
// Color
//////////////////////////////////////////////////////////////////

#define RGB(r, g, b)     [NSColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]
#define RGBA(r, g, b, a) [NSColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

//////////////////////////////////////////////////////////////////
// Format
//////////////////////////////////////////////////////////////////

//@interface DZUtility : NSObject
//
// void dail(NSString *strNum);
// void openURL(NSString *strURL);
// BOOL canOpenURL(NSString *strURL);
// void mailTo(NSString *strMailAddr);
// void showNetworkActivityIndicator(BOOL bShow);
// void ignoreTouch(BOOL bIgnore);
// NSString *documentsDirectory();
//
//@end

NS_ASSUME_NONNULL_END
