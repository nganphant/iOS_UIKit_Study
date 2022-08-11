//
//  NSBezierPath+toCGPath.h
//  DecoderApp1
//
//  Created by ngan on 2022/08/11.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBezierPath (toCGPath)
-(CGPathRef)toCGPath;
@end

NS_ASSUME_NONNULL_END
