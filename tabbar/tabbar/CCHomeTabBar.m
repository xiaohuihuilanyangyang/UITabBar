//
//  CCHomeTabBar.m
//  oupai
//
//  Created by qdms8-PC on 16/7/4.
//  Copyright © 2016年 bo. All rights reserved.
///

#import "CCHomeTabBar.h"
#import "UIView+AutoLayout.h"

#define kLiveButtonIndex 2

#define kPrivateButtonRedPointRadius 4

@interface CCTabBarCoverView : UIView

@property (nonatomic, weak) UIView *privateButton;

@property (nonatomic, assign) BOOL dismissRedPoint;

@end

@interface CCTabBarBackGroundView : UIView

@end

@interface CCHomeTabBar ()

@property (nonatomic, weak) CCTabBarBackGroundView *bgView;

@property (nonatomic, weak) CCTabBarCoverView *cover;

@property (nonatomic, weak) UIButton *liveButton;

@end

@implementation CCHomeTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if ( self = [super initWithFrame:frame] ) {
        [self setUpUI];
        self.clipsToBounds = NO;
        self.dismissRedPoint = YES;
    }
    return self;
}

- (void)setDismissRedPoint:(BOOL)dismissRedPoint {
    _dismissRedPoint = dismissRedPoint;
    self.cover.dismissRedPoint = dismissRedPoint;
}

- (void)setUpUI {
    CCTabBarBackGroundView  *bgView = [[CCTabBarBackGroundView alloc] init];
    [self addSubview:bgView];
    self.bgView = bgView;
    
    UIButton *liveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:liveButton];
    [liveButton setImage:[UIImage imageNamed:@"home_tab_my_nor"] forState:UIControlStateNormal];
    [liveButton addTarget:self action:@selector(liveButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
    self.liveButton = liveButton;
    
    CCTabBarCoverView *cover = [[CCTabBarCoverView alloc] init];
    cover.dismissRedPoint = YES;
    cover.userInteractionEnabled = NO;
    cover.backgroundColor = [UIColor clearColor];
    cover.dismissRedPoint = YES;
    [self addSubview:cover];
    self.cover = cover;

}

- (void)liveButtonDidClicked {
    if ( [self.delegate respondsToSelector:@selector(homeTabBarLiveButtonDidClicked:)] ) {
        [self.delegate homeTabBarLiveButtonDidClicked:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSMutableArray *tabbarButtonArray = [NSMutableArray array];
    
    for ( UIView *subView  in self.subviews) {
        if ( [subView isKindOfClass:[UIImageView class]] ) {
            [subView removeFromSuperview];
        } else if ( [subView isKindOfClass:NSClassFromString(@"UITabBarButton")] ){
            [tabbarButtonArray addObject:subView];
            if ( tabbarButtonArray.count == 3 ) {
                self.cover.privateButton = subView;
                [self.cover setNeedsDisplay];
            }
        }
    }
    
    CGFloat itemW = self.bounds.size.width / 5 ;
    
    for (NSInteger i = 0; i < tabbarButtonArray.count; i++) {
        UIView *tabBarButton = tabbarButtonArray[i];
        CGRect frame = tabBarButton.frame;
        frame.size.width = itemW ;
        if ( i < kLiveButtonIndex ) {
            frame.origin.x = i * itemW;
        } else {
            frame.origin.x = (i + 1) *itemW;
        }
        CGFloat itemWH = 30;
        for (UIView *subView in tabBarButton.subviews) {
            if ( [subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")] ) {
                CGPoint center = subView.center;
                CGRect frame = subView.frame;
                frame.size = CGSizeMake(itemWH, itemWH);
                subView.frame = frame;
                subView.center = center;
            }
        }
        
        tabBarButton.frame = frame;
    }
    itemW = 0.64 * itemW;
    CGRect buttonFrame = self.liveButton.frame;
    CGFloat buttonH = itemW;
    buttonFrame.size = CGSizeMake(itemW, buttonH);
    self.liveButton.frame = buttonFrame;
    
    CGPoint center = self.liveButton.center;
    center.x = self.bounds.size.width * 0.5;
    center.y = self.bounds.size.height - buttonH * 0.5;
    self.liveButton.center = center;
    
    self.bgView.frame =  CGRectMake(0, -10, self.bounds.size.width, self.bounds.size.height + 10);
    
    self.cover.frame = self.bgView.frame;
    
    [self bringSubviewToFront:self.cover];
}



@end

@implementation CCTabBarBackGroundView

- (instancetype)initWithFrame:(CGRect)frame{
    if ( self = [super initWithFrame:frame] ) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    //    CGFloat lineWidth = 0.3;
    // 矩形
    CGFloat height = 10;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, height, rect.size.width, rect.size.height - height)];
    [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9] set];
    [path fill];
    
    [[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9] set];
    
}

@end

@implementation CCTabBarCoverView

- (void)setDismissRedPoint:(BOOL)dismissRedPoint {
    _dismissRedPoint = dismissRedPoint;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if ( self.privateButton == nil ) {
        return;
    }
    
    if ( _dismissRedPoint ) {
        return;
    }
    
    CGPoint point = self.privateButton.center ;
    
    for (UIView *subView in self.privateButton.subviews) {
        if ( [subView isKindOfClass:[UIImageView class]] ) {
            UIImageView *view = (UIImageView *)subView;
            point.x += (view.image.size.width * 0.5 / [UIScreen mainScreen].scale + 0.5 * kPrivateButtonRedPointRadius + 2);
            point.y -= (view.image.size.height * 0.5 / [UIScreen mainScreen].scale - 0.5 * kPrivateButtonRedPointRadius );
            
        }
    }
    
    UIBezierPath *pathl =  [UIBezierPath bezierPathWithArcCenter:point radius:kPrivateButtonRedPointRadius startAngle:0 endAngle:(M_PI * 2) clockwise:YES];
    
    [[UIColor redColor] set];
    [pathl fill];
}

@end
