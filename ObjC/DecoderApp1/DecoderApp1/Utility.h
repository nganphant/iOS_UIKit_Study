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
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//////////////////////////////////////////////////////////////////
// ARC/no ARC
//////////////////////////////////////////////////////////////////

#if __has_feature(objc_arc)
//compiling with ARC
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
//#define IsiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//#define IsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//#define IsAfterIOS4 ([[[UIDevice currentDevice] systemVersion] intValue]>4)
//#define IsAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]>5)
//#define IsAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]>6)
//
//#define AppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
//////////////////////////////////////////////////////////////////
// CGRect
//////////////////////////////////////////////////////////////////

#define SetX(v, x)               v.frame = CGRectMake(x, v.frame.origin.y, v.frame.size.width, v.frame.size.height)
#define SetY(v, y)               v.frame = CGRectMake(v.frame.origin.x, y, v.frame.size.width, v.frame.size.height)
#define SetWidth(v, w)           v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, w, v.frame.size.height)
#define SetHeight(v, h)          v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, v.frame.size.width, h)
#define SetOrigin(v, x, y)       v.frame = CGRectMake(x, y, v.frame.size.width, v.frame.size.height)
#define SetSize(v, w, h)         v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y, w, h)
#define SetFrame(v, x, y, w, h)  v.frame = CGRectMake(x, y, w, h)
#define AddX(v, offset)          v.frame = CGRectMake(v.frame.origin.x + offset, v.frame.origin.y, v.frame.size.width, v.frame.size.height)
#define AddY(v, offset)          v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y + offset, v.frame.size.width, v.frame.size.height)

#define X(v)                     v.frame.origin.x
#define Y(v)                     v.frame.origin.y
#define Width(v)                 v.frame.size.width
#define Height(v)                v.frame.size.height
#define Origin(v)                v.frame.origin
#define Size(v)                  v.frame.size

//////////////////////////////////////////////////////////////////
// Color
//////////////////////////////////////////////////////////////////

#define RGB(r, g, b)        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//////////////////////////////////////////////////////////////////
// Format
//////////////////////////////////////////////////////////////////


//@interface DZUtility : NSObject
//
//void dail(NSString *strNum);
//void openURL(NSString *strURL);
//BOOL canOpenURL(NSString *strURL);
//void mailTo(NSString *strMailAddr);
//void showNetworkActivityIndicator(BOOL bShow);
//void ignoreTouch(BOOL bIgnore);
//NSString *documentsDirectory();
//
//@end


NS_ASSUME_NONNULL_END
