//
//  HTTPClient.m
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/12.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

- (id)getRequest:(NSString*)url
{
    return nil;
}

- (id)postRequest:(NSString*)url body:(NSString*)body
{
    return nil;
}

- (UIImage*)downloadImage:(NSString*)url
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return [UIImage imageWithData:data];
}

@end
