//
//  CCHomeTabBar.h
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCHomeTabBar;

@protocol CCHomeTabBarDelegate <UITabBarDelegate>

@optional
- (void)homeTabBarLiveButtonDidClicked:(CCHomeTabBar *)tabBar;

@end

@interface CCHomeTabBar : UITabBar

@property (nonatomic, assign) BOOL dismissRedPoint;

@property (nonatomic, assign) id<CCHomeTabBarDelegate>delegate;

@end

