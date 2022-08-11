//
//  AboutVC.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/11.
//

#import "AboutVC.h"
#import "Utility.h"

@interface AboutVC ()

@end

@implementation AboutVC {

    __weak IBOutlet NSImageView *_imgZOOM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)initWindowUI {
    NSWindow *win            = self.view.window;
    NSButton *maximizeButton = [win standardWindowButton:NSWindowZoomButton];
    [maximizeButton setEnabled:NO];
    [win setTitle:@"About"];
    win.backgroundColor = [NSColor colorNamed:@"AppBG"];
    win.styleMask &= ~NSWindowStyleMaskResizable;
}

- (void)viewWillAppear {
    [super viewWillAppear];

    [self initWindowUI];
}
@end
