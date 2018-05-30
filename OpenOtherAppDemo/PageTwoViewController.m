//
//  PageTwoViewController.m
//  OpenOtherAppDemo
//
//  Created by zengyan.bu on 2018/5/23.
//  Copyright © 2018年 zengyan.bu. All rights reserved.
//

#import "PageTwoViewController.h"
#import "AppDelegate.h"

@interface PageTwoViewController ()
@property (nonatomic, strong)   UIButton *btn;
@end

@implementation PageTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PageTwo";
    self.view.backgroundColor = [UIColor blueColor];
    
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
    NSString *backUrlStr = [[urlStr componentsSeparatedByString:@"?"] lastObject];
    NSString *backScheme = [backUrlStr stringByAppendingString:@"://"];
    NSURL *backSchemeUrl = [NSURL URLWithString:backScheme];
    if (@available(iOS 10,*)) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:backSchemeUrl options:@{} completionHandler:^(BOOL success) {
            }];
        }
    }else{
        if ([[UIApplication sharedApplication] canOpenURL:backSchemeUrl]) {
            [[UIApplication sharedApplication] openURL:backSchemeUrl];
        }
    }

    // 延时1秒执行
    // 方法一：效果最好
    
    [self performSelector:@selector(popVC) withObject:nil afterDelay:1.0f];
    // 方法二：
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(1*NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
//        //
//        [self performSelector:@selector(popVC) withObject:nil];
//    });
    
    // 方法三：
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //
//        [self performSelector:@selector(popVC) withObject:nil afterDelay:1];
//        // 此时需要加入runloop
//        [[NSRunLoop currentRunLoop] run];
//    });
    
   
}

- (void)popVC{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
