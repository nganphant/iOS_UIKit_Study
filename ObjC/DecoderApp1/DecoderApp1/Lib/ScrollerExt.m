//
//  ScrollerExt.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/11.
//

#import "ScrollerExt.h"
#import "Utility.h"

@implementation ScrollerExt{
    NSColor* _bgColor;
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
    
        _bgColor = [NSColor colorNamed:@"AppBGLight"];
}

- (void)drawRect:(NSRect)dirtyRect{
    [_bgColor setFill];
    NSRectFill(dirtyRect);

    [NSColor.whiteColor setFill];
    [self drawKnob];
}

@end
