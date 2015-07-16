//
//  Album+TableRepresentation.m
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/14.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)

- (NSDictionary *)tr_tableRepresentation {
    return @{ @"title":@[@"Artist", @"Album", @"Genre", @"Year"],
              @"value":@[self.artist, self.title, self.genre, self.year]
              };
}

@end
