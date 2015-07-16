//
//  Album.m
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/12.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *)year {
    if (self = [super init]) {
        _title = title;
        _artist = artist;
        _coverUrl = coverUrl;
        _year = year;
        _genre = @"Pop";
    }
    return self;
}

@end
