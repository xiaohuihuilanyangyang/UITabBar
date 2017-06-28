//
//  CCNavigationController.m
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
//

#import "CCNavigationController.h"

@interface CCNavigationController ()

@end

@implementation CCNavigationController

+ (instancetype)navigationWithWrapController:(UIViewController *)controller {
    return [[CCNavigationController alloc] initWithRootViewController:controller];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
