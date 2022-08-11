//
//  FileListCell.h
//  DecoderApp1
//
//  Created by ngan on 2022/08/10.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface                             FileListCell : NSTableCellView
@property (weak) IBOutlet NSImageView *imgFileIcon;
@property (weak) IBOutlet NSTextField *lblFileName;

@property (class, readonly) NSString *CELL_ID;
@end

NS_ASSUME_NONNULL_END
