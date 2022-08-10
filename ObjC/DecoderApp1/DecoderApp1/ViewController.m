//
//  ViewController.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/09.
//

#import "ViewController.h"
#import "Utility.h"
#import "FileListCell.h"
#import "FolderHelper.h"

@implementation ViewController{
    
    __weak IBOutlet NSTableView *_tableFile;
    __weak IBOutlet NSTextField *_txtFolderPath;
    
    FolderHelper* _folderHelper;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    // For click on the folder text field
    NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(txtFolder_Click:)];
    [_txtFolderPath addGestureRecognizer:click];
    
    _tableFile.dataSource = self;
    _tableFile.delegate=self;
    
    _tableFile.tableColumns[0].width=300;
    
    _tableFile.tableColumns[0].width=300;
}
- (void)viewDidLayout{
    [super viewDidLayout];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - NSTableView
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return  50;//_folderHelper == nil ? 0 : _folderHelper.files.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    FileListCell* cell = [tableView makeViewWithIdentifier:FileListCell.CELL_ID owner:nil];
    WavItem* wavItem = _folderHelper.files[row];
    
//    cell.lblFileName.stringValue=wavItem.fileName;
//    cell.imgFileIcon.image = wavItem.icon;
    return cell;
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
            
            _folderHelper = [[FolderHelper alloc]initWithFolderPath:result];
            [_tableFile reloadData];
        }
        
    }
}

- (IBAction)btnGoUp_Click:(id)sender {
    FUNC_LOG();
}

@end
