//
//  ViewController.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/09.
//

#import "ViewController.h"
#import "AboutVC.h"
#import "FileListCell.h"
#import "FolderHelper.h"
#import "Utility.h"

@implementation ViewController {

  __weak IBOutlet NSTableView *_tableFile;
  __weak IBOutlet NSTextField *_txtFolderPath;
  __weak IBOutlet NSButton *_btnFolderUp;

  FolderHelper *_folderHelper;
}

#pragma mark - LIFE CYCLE
- (void)viewDidLoad {
  [super viewDidLoad];

  // For click on the folder text field
  NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc]
      initWithTarget:self
              action:@selector(txtFolder_Click:)];
  [_txtFolderPath addGestureRecognizer:click];

  _tableFile.dataSource = self;
  _tableFile.delegate = self;
}
- (void)viewDidLayout {
  [super viewDidLayout];
}

- (void)setRepresentedObject:(id)representedObject {
  [super setRepresentedObject:representedObject];

  // Update the view, if already loaded.
}

#pragma mark - NSTableView
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
  return _folderHelper == nil ? 0 : _folderHelper.files.count;
}

- (NSView *)tableView:(NSTableView *)tableView
    viewForTableColumn:(NSTableColumn *)tableColumn
                   row:(NSInteger)row {
  //    return [tableView makeViewWithIdentifier:@"abcd" owner:nil];
  FileListCell *cell = [tableView makeViewWithIdentifier:FileListCell.CELL_ID
                                                   owner:nil];
  WavItem *wavItem = _folderHelper.files[row];
  NSLog(@"CREATE CELL");
  cell.lblFileName.stringValue = wavItem.fileName;
  cell.imgFileIcon.image = wavItem.icon;
  return cell;
}

#pragma mark - UI EVENT

- (void)txtFolder_Click:(id)sender {
  FUNC_LOG();

  NSOpenPanel *dialog = [NSOpenPanel openPanel];

  dialog.title = @"Choose a file| Our Code World";
  dialog.showsResizeIndicator = true;
  dialog.showsHiddenFiles = false;
  dialog.allowsMultipleSelection = false;
  dialog.canChooseDirectories = true;
  dialog.canChooseFiles = NO; // say no to file

  if ([dialog runModal] == NSModalResponseOK) {
    NSURL *result = dialog.URL; // Pathname of the file

    if (result != nil) {
      // /Users/ourcodeworld/Desktop/ABC/
      [self openFolder:result];
    }
  }
}

- (IBAction)btnAbout_Click:(id)sender {
  FUNC_LOG();

  AboutVC *about = [AboutVC new];
  [self presentViewControllerAsModalWindow:about];
}

- (IBAction)btnGoUp_Click:(id)sender {
  FUNC_LOG();

  // did not select folder yet
  if (_folderHelper == nil) {
    return;
  }

  NSFileManager *fm = NSFileManager.defaultManager;
  NSString *curFolder = _folderHelper.folderPath.path;
  NSString *parentFolder = [curFolder stringByDeletingLastPathComponent];

  // no parent?
  if (parentFolder == nil || parentFolder.length == 0) {
    return;
  }

  // can not find parent folder?
  if (![fm fileExistsAtPath:parentFolder]) {
    return;
  }

  [self openFolder:[[NSURL alloc] initFileURLWithPath:parentFolder]];
}

#pragma mark - HELPER FUNC
- (void)openFolder:(NSURL *)result {

  NSString *path = result.path;
  NSLog(@"open folder: %@", path);

  _txtFolderPath.stringValue = path;
  [[_txtFolderPath currentEditor] moveToEndOfLine:nil];

  _folderHelper = [[FolderHelper alloc] initWithFolderPath:result];

  NSLog(@"START RELOAD");
  [_tableFile reloadData];
  NSLog(@"END RELOAD");
  [self autoResizeColumn];
}

- (void)autoResizeColumn {
  NSTableView *tableView = _tableFile;
  NSInteger columnIndex = 0;
  CGFloat maxSize = 0;
  for (NSInteger i = 0; i < tableView.numberOfRows; i++) {
    FileListCell *cell = [tableView viewAtColumn:columnIndex
                                             row:i
                                 makeIfNecessary:YES];
    NSSize size = [cell fittingSize];
    maxSize = MAX(maxSize, size.width);
  }

  _tableFile.tableColumns[0].minWidth = maxSize;
  _tableFile.tableColumns[0].width = maxSize + 1;
}

@end
