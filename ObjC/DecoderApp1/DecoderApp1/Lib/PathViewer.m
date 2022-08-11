//
//  PathViewer.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/11.
//

#import "PathViewer.h"
#import "Utility.h"

@implementation PathViewer

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
    _text=@"";
}

- (void)setText:(NSString *)text{
    _text=text;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSColor blackColor], NSForegroundColorAttributeName, nil];

    NSAttributedString * currentText=[[NSAttributedString alloc] initWithString:_text attributes: attributes];

    CGRect bound = self.bounds;
    NSSize attrSize = [currentText size];
    CGFloat x = bound.size.width-attrSize.width;
    CGFloat y = (bound.size.height - attrSize.height)/2;
    [currentText drawAtPoint:NSMakePoint(MIN(x, 0),
                                         FLIP_Y(y, attrSize.height, self.bounds.size.height))];
}

@end
