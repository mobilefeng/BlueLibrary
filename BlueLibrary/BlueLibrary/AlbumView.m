//
//  AlbumView.m
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/13.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "AlbumView.h"

#define kCoverImageMargin (5)

@implementation AlbumView {
    UIImageView *coverImage;
    UIActivityIndicatorView *indicator;
}

- (id)initWithFrame:(CGRect)frame albumCover:(NSString *)albumCover {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        
        coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(kCoverImageMargin,
                                                                  kCoverImageMargin,
                                                                  self.frame.size.width - 2*kCoverImageMargin,
                                                                  self.frame.size.height - 2*kCoverImageMargin
                                                                  )];
        [self addSubview:coverImage];
        
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
    }
    
    return self;
}

@end
