//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/14.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

// tr is short for TableRepresentation
- (NSDictionary*)tr_tableRepresentation;

@end
