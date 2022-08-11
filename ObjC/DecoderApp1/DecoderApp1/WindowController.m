//
//  WindowController.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/09.
//

#import "WindowController.h"

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];

//    self.window.ove
    self.window.backgroundColor = [NSColor colorNamed:@"AppBG"];
    
    //NSScreen *screen     = self.window.screen;
    NSScreen *screen     = self.window.screen;
    CGRect    screenRect = screen.visibleFrame;
//    CGSize    winSize    = CGSizeMake(screenRect.size.width / 10 * 7, screenRect.size.height / 10 * 7);
    CGSize    winSize = CGSizeMake(1050, 668);
    //    CGSize winSize = CGSizeMake(900, 300);
    [self.window setFrame:NSMakeRect(screenRect.origin.x + (screenRect.size.width - winSize.width) / 2,
                                     CGRectGetMaxY(screenRect) - winSize.height - (screenRect.size.height - winSize.height) / 2,
                                     winSize.width, winSize.height)
                  display:YES];
}

@end
