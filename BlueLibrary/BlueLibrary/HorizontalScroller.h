//
//  HorizontalScroller.h
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/14.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

// weak 防止循环引用
// id 意味着 delegate 属性可以用任何遵从 HorizontalScrollerDelegate 的类赋值
@property (weak) id<HorizontalScrollerDelegate> delegate;
- (void)reload;

@end

// _____________________________________________________________________________________
//
@protocol HorizontalScrollerDelegate <NSObject>

@required
// ask the delegate how many views he wants to present inside the horizontal scroller
- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller;

// ask the delegate to return the view that should appear at <index>
- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index;

// inform the delegate what the view at <index> has been clicked
- (void)horizontalScroller:(HorizontalScroller*)scroller clickedViewAtIndex:(int)index;

@optional
// ask the delegate for the index of the initial view to display. this method is optional
// and defaults to 0 if it's not implemented by the delegate
- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller*)scroller;

@end
