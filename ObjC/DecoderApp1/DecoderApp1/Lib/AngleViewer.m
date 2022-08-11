//
//  AngleViewer.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/11.
//

#import "AngleViewer.h"
#import "NSBezierPath+toCGPath.h"
#import "Utility.h"
#import <QuartzCore/QuartzCore.h>

#define MIN_VAL (0)
#define MAX_VAL (150)
#define INIT_ANGLE (90)
#define THUMB_SIZE (20)

@implementation AngleViewer{
//    CAShapeLayer* _circle;
    CGSize _cacheSize;
    NSBezierPath *_benBG;
    NSBezierPath *_benMove;
    
    NSBezierPath* _0ben;
    NSBezierPath* _150ben;
    
    NSBezierPath *_benThumb;
    
    NSColor* _grayCircleColor;
    
    CGFloat _angle;
    CGFloat RADIUS;
    
    CGPoint _pointOnCircle;
    CGPoint _point0Deg;
    CGPoint _point150Deg;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    _angle=0;
    _grayCircleColor=RGB(0x58,0x58,0x58);
    _benThumb = [NSBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, THUMB_SIZE, THUMB_SIZE)];
}

- (void)layout{
    [super layout];

    if (CGSizeEqualToSize(_cacheSize, self.bounds.size)) {
        return;
    }
    _cacheSize = self.bounds.size;
    _benBG = [NSBezierPath bezierPath];
    _benBG.lineWidth=4;
    
    NSPoint center = NSMakePoint(_cacheSize.width/2, _cacheSize.height/2);
    RADIUS=_cacheSize.width/10*8 /2;
    _point0Deg = CGPointMake(center.x, center.y + RADIUS);
    _pointOnCircle=_point0Deg;
    
    _point150Deg.x=center.x+(RADIUS * cos(DEG2RAD(-120)));
    _point150Deg.y=center.y+(RADIUS * sin(DEG2RAD(-120)));
//    _pointOnCircle=_point150Deg;
    
    [_benBG appendBezierPathWithArcWithCenter:center
                                    radius:RADIUS
                                startAngle:INIT_ANGLE endAngle:INIT_ANGLE+MAX_VAL];
    
    _benMove = [NSBezierPath bezierPath];
    _benMove.lineWidth=_benBG.lineWidth;
    [_benMove appendBezierPathWithArcWithCenter:center
                                    radius:RADIUS
                                startAngle:INIT_ANGLE endAngle:INIT_ANGLE];
    
    _150ben=_benBG;
    _0ben=_benMove;
   
    
    
}

- (void)drawRect:(NSRect)dirtyRect{
//    [NSColor.whiteColor setFill];
//    NSRectFill(dirtyRect);
    
    if (_benBG==nil) {
        return;
    }
    [_grayCircleColor setStroke];
    [_benBG stroke];
    
    [NSColor.whiteColor setStroke];
    [_benMove stroke];
    
    [NSColor.whiteColor setFill];
    [NSGraphicsContext saveGraphicsState];
    
    NSAffineTransform* xform = [NSAffineTransform transform];
    [xform translateXBy:_pointOnCircle.x-THUMB_SIZE/2 yBy:_pointOnCircle.y-THUMB_SIZE/2];
    [xform concat];
    
    [_benThumb fill];
    
    [NSGraphicsContext restoreGraphicsState];
}

- (void)mouseDown:(NSEvent *)event{
    FUNC_LOG();
    
   
}

- (void)mouseDragged:(NSEvent *)event{
//    FUNC_LOG();
    
    NSPoint event_location = [event locationInWindow];
    NSPoint local_point = [self convertPoint:event_location fromView:nil];
    NSLog(@"Click at %@", NSStringFromPoint(local_point));
 
    NSPoint center = NSMakePoint(_cacheSize.width/2, _cacheSize.height/2);
//    eee=CGPointMake(center.x, local_point.y);
    
    CGFloat diffY = local_point.y - center.y;
    if (diffY>RADIUS) {
        _benMove=_0ben;
        _pointOnCircle=_point0Deg;
        
        [self setNeedsDisplay:YES];
        return;
    }
    //pitago
    //binh phuong canh huyen = tong binh phuong 2 canh goc vuong
    CGFloat C2 = RADIUS;//radius
    CGFloat B2 = diffY;
    CGFloat A2 = pow(C2, 2) - pow(B2,2);
    CGFloat A = sqrt(A2);
    
    _pointOnCircle = CGPointMake(center.x - A, local_point.y);
    CGFloat radian = atan2(_pointOnCircle.y-center.y, _pointOnCircle.x-center.x);
    
    _angle = radian*(180.0f/M_PI) - 90;
        if (_angle < 0.0)
            _angle += 360.0;
        NSLog(@"angle %f", _angle);
    if (_angle>MAX_VAL) {
        _benMove=_150ben;
        _pointOnCircle=_point150Deg;
        [self setNeedsDisplay:YES];
        return;
    }
    
    _benMove = [NSBezierPath bezierPath];
    _benMove.lineWidth=_benBG.lineWidth;
    [_benMove appendBezierPathWithArcWithCenter:center
                                    radius:RADIUS
                                startAngle:INIT_ANGLE endAngle:INIT_ANGLE+_angle];
    
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event{
    FUNC_LOG();
}

@end
