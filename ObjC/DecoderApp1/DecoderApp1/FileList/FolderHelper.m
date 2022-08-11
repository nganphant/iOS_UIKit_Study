//
//  FolderHelper.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/10.
//

#import "FolderHelper.h"

@implementation FolderHelper

- (instancetype)initWithFolderPath:(NSURL *)folderURL {
  self = [super init];
  if (self) {
    _folderPath = folderURL;
    _files = [NSMutableArray new];

    // grab the files
    [self grabWavFiles];

    // sort list
    [self sortFileList];
  }
  return self;
}

- (void)sortFileList {
  [_files sortUsingComparator:^NSComparisonResult(id _Nonnull obj1,
                                                  id _Nonnull obj2) {
    WavItem *item1 = obj1;
    WavItem *item2 = obj2;

    if ((item1.isFolder && item2.isFolder) ||
        (!item1.isFolder && !item2.isFolder)) {
      // compare 2 folder
      // compare 2 file
      return [item1.fileName compare:item2.fileName];
    } else {
      // compare file and folder
      if (item1.isFolder) {
        return NSOrderedAscending;
      } else {
        return NSOrderedDescending;
      }
    }

    return NSOrderedAscending;
  }];
}

- (void)grabWavFiles {
  [_files removeAllObjects];

  // get name of file, folder or file, icon of item
  NSArray *resourceKey =
      @[ NSURLLocalizedNameKey, NSURLIsDirectoryKey, NSURLEffectiveIconKey ];

  NSFileManager *fm = NSFileManager.defaultManager;

  // retrieve list of file/folder. skip hidden items
  NSDirectoryEnumerator<NSURL *> *files = [fm
                 enumeratorAtURL:self.folderPath
      includingPropertiesForKeys:resourceKey
                         options:
                             NSDirectoryEnumerationSkipsHiddenFiles |
                             NSDirectoryEnumerationSkipsPackageDescendants |
                             NSDirectoryEnumerationSkipsSubdirectoryDescendants
                    errorHandler:^BOOL(NSURL *_Nonnull url,
                                       NSError *_Nonnull error) {
                      if (error != nil) {
                        NSLog(@"eeee");
                      }
                      return YES;
                    }];

  // create list for UI
  for (NSURL *file in files) {

    NSDictionary<NSURLResourceKey, id> *properties =
        [file resourceValuesForKeys:resourceKey error:nil];
    NSNumber *isDir = properties[NSURLIsDirectoryKey];
    if (isDir == nil) {
      continue;
    }

    NSLog(@"file path is %@", file.path);
    WavItem *wavItem = [WavItem new];
    wavItem.fullPath = file.path;
    wavItem.icon = properties[NSURLEffectiveIconKey];
    wavItem.fileName = properties[NSURLLocalizedNameKey];
    wavItem.isFolder = isDir.boolValue;
    [_files addObject:wavItem];
  }
}
@end

@implementation WavItem

@end
