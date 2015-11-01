//
//  ViewController.m
//  ZJStatusBarHUDDemo
//
//  Created by 侯宝伟 on 15/10/31.
//  Copyright © 2015年 ZHUNJIEE. All rights reserved.
//

#import "ViewController.h"
#import "ZJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)successButtonClick {
    [ZJStatusBarHUD showSuccess:@"登录成功"];
}

- (IBAction)errorButtonClick {
    [ZJStatusBarHUD showError:@"登录失败"];
}

- (IBAction)loadingButtonClick {
    [ZJStatusBarHUD showLoading:@"正在登录中..."];
}

- (IBAction)hideButtonClick {
    [ZJStatusBarHUD hide];
}

- (IBAction)testButtonclick {
//    [ZJStatusBarHUD showText:@"我只是用来测试的"];
    [ZJStatusBarHUD showImage:[UIImage imageNamed:@"test_image"] text:@"我只是用来测试的"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
