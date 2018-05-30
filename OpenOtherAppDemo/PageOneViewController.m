//
//  PageOneViewController.m
//  OpenOtherAppDemo
//
//  Created by zengyan.bu on 2018/5/23.
//  Copyright © 2018年 zengyan.bu. All rights reserved.
//

#import "PageOneViewController.h"
#import "AppDelegate.h"

@interface PageOneViewController ()
@property (nonatomic, strong)   UIButton *btn;
@end

@implementation PageOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PageOne";
    self.view.backgroundColor = [UIColor orangeColor];
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = self.view.bounds;
    self.btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.btn setTitle:@"返回原APP" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

- (void)btnClick:(UIButton *)btn{
    NSURL *url = ((AppDelegate *)[UIApplication sharedApplication].delegate).url;
    NSString *urlStr = [url absoluteString];
    
    // 配置返回原APP的URL scheme
    NSString *urlSchemeStr = [[urlStr componentsSeparatedByString:@"?"] lastObject];
    NSString *urlScheme = [urlSchemeStr stringByAppendingString:@"://"];
    NSURL *backURL = [NSURL URLWithString:urlScheme];

    // 判断系统版本
    if (@available(iOS 10,*)) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:backURL options:@{} completionHandler:^(BOOL success) {
                //
            }];
        }
    }else{
        if ([[UIApplication sharedApplication] canOpenURL:backURL]) {
            [[UIApplication sharedApplication] openURL:backURL];
        }
    }
    
     [self performSelector:@selector(popVC) withObject:nil afterDelay:1.0f];
//    [self.navigationController popViewControllerAnimated:YES];
    
  
}

- (void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
