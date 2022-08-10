//
//  FolderHelper.m
//  DecoderApp1
//
//  Created by ngan on 2022/08/10.
//

#import "FolderHelper.h"

@implementation FolderHelper

- (instancetype)initWithFolderPath:(NSURL*)folderURL
{
    self = [super init];
    if (self) {
        _folderPath = folderURL;
        _files = [NSMutableArray new];
        [self grabWavFiles];
    }
    return self;
}

-(void)grabWavFiles{
    [_files removeAllObjects];
    
    NSArray* resourceKey = @[NSURLLocalizedNameKey, NSURLIsDirectoryKey, NSURLEffectiveIconKey];
    
    NSFileManager* fm = NSFileManager.defaultManager;
    
    NSDirectoryEnumerator<NSURL *> * files = [fm enumeratorAtURL:self.folderPath includingPropertiesForKeys:resourceKey
                options:NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsPackageDescendants | NSDirectoryEnumerationSkipsSubdirectoryDescendants
           errorHandler:nil];
    
    for (NSURL* file in files) {
        
        NSDictionary<NSURLResourceKey, id> * properties = [file resourceValuesForKeys:resourceKey error:nil];
        NSNumber* isDir = properties[NSURLIsDirectoryKey];
        if (isDir==nil || isDir.boolValue) {
            continue;
        }
        
        NSLog(@"file path is %@", file.path);
        WavItem* wavItem = [WavItem new];
        wavItem.fullPath = file.path;
        wavItem.icon = properties[NSURLEffectiveIconKey];
        wavItem.fileName = properties[NSURLLocalizedNameKey];
        [_files addObject:wavItem];
    }
}
@end

@implementation WavItem

@end
