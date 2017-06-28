//
//  CCHomeTabBarItem.h
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCHomeTabBarItem : UITabBarItem

@property (nonatomic, weak) UIViewController *controller;
@property (nonatomic,weak) UIViewController *sercontr;
- (instancetype)initWithController:(UIViewController *)controller;
+ (instancetype)homeTabBarItemWithController:(UIViewController *)controller;

@end
