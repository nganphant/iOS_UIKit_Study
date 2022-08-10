//
//  ViewController.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/09.
//

#import "ViewController.h"
#import "Utility.h"

@implementation ViewController{
    
    __weak IBOutlet NSTextField *_txtFolderPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(txtFolder_Click:)];
    [_txtFolderPath addGestureRecognizer:click];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - UI EVENT

-(void)txtFolder_Click:(id)sender{
    FUNC_LOG();
    
    NSOpenPanel* dialog = [NSOpenPanel openPanel];

    dialog.title                   = @"Choose a file| Our Code World";
    dialog.showsResizeIndicator    = true;
    dialog.showsHiddenFiles        = false;
    dialog.allowsMultipleSelection = false;
    dialog.canChooseDirectories = true;
    dialog.canChooseFiles = NO;//say no to file

    if ([dialog runModal] == NSModalResponseOK) {
        NSURL* result = dialog.URL;// Pathname of the file
        
        if (result != nil) {
            // /Users/ourcodeworld/Desktop/ABC/
            NSString* path = result.path;
            NSLog(@"User picked folder: %@", path);
            
            _txtFolderPath.stringValue = path;
            [[_txtFolderPath currentEditor] moveToEndOfLine:nil];
        }
        
    }
}

- (IBAction)btnGoUp_Click:(id)sender {
    FUNC_LOG();
}

@end
