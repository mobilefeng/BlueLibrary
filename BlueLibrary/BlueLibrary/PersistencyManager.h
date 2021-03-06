//
//  PersistencyManager.h
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/13.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Album.h"

@interface PersistencyManager : NSObject

- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

- (void)saveImage:(UIImage *)image filename:(NSString *)filename;
- (UIImage *)getImage:(NSString *)filename;

@end
