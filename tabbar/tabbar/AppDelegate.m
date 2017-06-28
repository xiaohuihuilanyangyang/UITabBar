//
//  AppDelegate.m
//  tabbar
//
//  Created by 程辉 on 2017/6/28.
//  Copyright © 2017年 SYJM. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)setUpHomeController {
    if ( self.homeVC ) {
        self.window.rootViewController = self.homeVC;
        return;
    }
    
    NSMutableArray *items = [NSMutableArray array];
    //点播中心
    
    CCFristViewController *demandVC = [[CCFristViewController alloc]init];
    //    demandVC.channelVideoType = RMChannelVideoTypeDemand;
    CCNavigationController *demandNav = [CCNavigationController navigationWithWrapController:demandVC];
    CCHomeTabBarItem *demandItem = [CCHomeTabBarItem homeTabBarItemWithController:demandNav];
    [items addObject:demandItem];
    
    //直播中心
    CCSenondViewController *liveVC = [[CCSenondViewController alloc]init];
    //    liveVC.channelVideoType = RMChannelVideoTypeLive;
    CCNavigationController *liveNav = [CCNavigationController navigationWithWrapController:liveVC];
    CCHomeTabBarItem *liveItem = [CCHomeTabBarItem homeTabBarItemWithController:liveNav];
    [items addObject:liveItem];
    
    //    // 发现
    //    CCDiscoverController *discoverVC = [[CCDiscoverController alloc] init];
    //    CCNavigationController *discoverNav = [CCNavigationController navigationWithWrapController:discoverVC];
    //    CCHomeTabBarItem *discoverItem = [CCHomeTabBarItem homeTabBarItemWithController:discoverNav];
    //    [items addObject:discoverItem];
    
    // 招呼(站内信)
    CCThereViewController *notifyVC = [[CCThereViewController alloc] init];
    CCNavigationController *notifyNav = [CCNavigationController navigationWithWrapController:notifyVC];
    CCHomeTabBarItem *notify = [CCHomeTabBarItem homeTabBarItemWithController:notifyNav];
    [items addObject:notify];
    
    // 我的
    CCMineViewController *mineVC = [[CCMineViewController alloc] init];
    CCNavigationController *mineNav = [CCNavigationController navigationWithWrapController:mineVC];
    CCHomeTabBarItem *mineItem = [CCHomeTabBarItem homeTabBarItemWithController:mineNav];
    [items addObject:mineItem];
    
    CCHomeViewController *homeVC = [CCHomeViewController homeViewControllerWithItems:items];
    homeVC.selectedIndex = 0;
    
    self.window.rootViewController = homeVC;
    self.homeVC = homeVC;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    win.backgroundColor = [UIColor whiteColor];
    self.window = win;
    
    [self setUpHomeController];
    
    [win makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
