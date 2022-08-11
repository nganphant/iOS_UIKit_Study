//
//  FolderHelper.h
//  DecoderApp1
//
//  Created by ngan on 2022/08/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class WavItem;

@interface FolderHelper : NSObject

@property(readonly) NSURL *folderPath;
@property NSMutableArray<WavItem *> *files;

- (instancetype)initWithFolderPath:(NSURL *)folderURL;
@end

@interface WavItem : NSObject

/// ex: ABC.wav
@property NSString *fileName;

/// wav icon
@property NSImage *icon;

/// ex: User/Document/ABC.wav
@property NSString *fullPath;

@property BOOL isFolder;

@end

NS_ASSUME_NONNULL_END
