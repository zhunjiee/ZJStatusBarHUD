//
//  ZJStatusBarHUD.m
//  ZJStatusBarHUDDemo
//
//  Created by 侯宝伟 on 15/10/31.
//  Copyright © 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJStatusBarHUD.h"

@implementation ZJStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

/** window出现和隐藏需要的时间 */
static CGFloat const ZJDuration = 0.25;
/** window从出现到隐藏的时间间隔 */
static CGFloat const ZJTimeInterval = 2.0;
/** 文字与图片之间的间距常量 */
static CGFloat const ZJEdgeInsets = 5;

#pragma mark - 私有方法
+ (void)setupText:(NSString *)text image:(UIImage *)image{
    
    // 创建window
    window_ = [[UIWindow alloc] init];
    CGRect windowFrame = [UIApplication sharedApplication].statusBarFrame;
    window_.frame = windowFrame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor blackColor];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.frame;
    [window_ addSubview:button];
    
    // 设置按钮数据
    [button setTitle:text forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    // 其他设置
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, ZJEdgeInsets, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, ZJEdgeInsets);
    }
    
    // window出现动画
    CGRect beginWindowFrame = windowFrame;
    beginWindowFrame.origin.y = - beginWindowFrame.size.height;
    window_.frame = beginWindowFrame;
    
    [UIView animateWithDuration:ZJDuration animations:^{
        window_.frame = windowFrame;
    }];
}


#pragma mark - 公共方法
+ (void)showText:(NSString *)text{
    [self setupText:text image:nil];
}

+ (void)showImage:(UIImage *)image text:(NSString *)text {
    // 停止上次定时器
    [timer_ invalidate];
    
    // 开启定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZJTimeInterval target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    [self setupText:text image:image];
}

+(void)showSuccess:(NSString *)text{
    [self showImage:[UIImage imageNamed:@"ZJStatusBarHUD.bundle/success"] text:text];
}

+ (void)showError:(NSString *)text{
    [self showImage:[UIImage imageNamed:@"ZJStatusBarHUD.bundle/error"] text:text];
}

+ (void)showLoading:(NSString *)text{
    [self setupText:text image:nil];
    CGRect windowFrame = window_.frame;
    UIButton *button = window_.subviews.lastObject;
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    [button.titleLabel sizeToFit];
    CGFloat loadingCenterX = (windowFrame.size.width - button.titleLabel.frame.size.width) * 0.5 - 10;
    loadingView.center = CGPointMake(loadingCenterX, window_.frame.size.height * 0.5);
    [window_ addSubview:loadingView];

}

+ (void)hide{
    // 清空定时器
    [timer_ invalidate];
    timer_ = nil;
    
    CGRect beginWindowFrame = window_.frame;
    beginWindowFrame.origin.y = - beginWindowFrame.size.height;
    
    [UIView animateWithDuration:ZJDuration animations:^{
        window_.frame = beginWindowFrame;
        
    }completion:^(BOOL finished) {
        // 如果定时器是nil，说明在hide动画期间没有创建新窗口
        if(timer_ == nil) window_ = nil;
    }];
}
@end
