//
//  CCHomeViewController.h
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCHomeTabBarItem.h"



@interface CCHomeViewController : UITabBarController

/**
 *  初始化方法
 *
 *  @param items
 *
 *  @return
 */
+ (instancetype)homeViewControllerWithItems:(NSArray *)items;



@end
