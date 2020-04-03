//
//  ViewController.m
//  OpenOtherAppDemo
//
//  Created by zengyan.bu on 2018/5/8.
//  Copyright © 2018年 zengyan.bu. All rights reserved.
//  打开其他APP

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kPointX (30)
#define kButtonHeight (44)

#import "ViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (nonatomic, strong)   UIButton    *btn;
@property (nonatomic, strong)   UIButton    *btn1;

@property (nonatomic, strong)   UIButton    *btn2;
@property (nonatomic, strong)   UIButton    *btn3;
@property (nonatomic, strong)   PageOneViewController *oneVc;

@end

@implementation ViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"打开其他APP";
    
    
    
    
    [self.view addSubview:self.btn];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToPointVC) name:@"PushToPointVC" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - 跳转到指定页面
- (void)pushToPointVC{
    NSURL *url = ((AppDelegate *)[UIApplication sharedApplication].delegate).url;
    if (url) {
        NSLog(@"url = %@ ,host = %@",[url absoluteString],[url host]);
        if ([[url host] isEqualToString:@"PageTwo"]) {
            // 跳转到PageTwoVC
            [self pushToPageTwo];
        }else if ([[url host] isEqualToString:@"PageOne"]){
            // 跳转到PageOneVC
            [self pushToPageOne];
        }
    }
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(kPointX, kPointX + 64, kScreenWidth - kPointX * 2, kButtonHeight);
        [_btn setTitle:@"turn to Map" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn.layer.masksToBounds = YES;
        _btn.layer.cornerRadius = 8;
        _btn.tag = 222;
        _btn.layer.borderColor = [UIColor blueColor].CGColor;
        _btn.layer.borderWidth = 1;
    }
    return _btn;
}

- (UIButton *)btn1{
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.frame = CGRectMake(kPointX, kPointX + kButtonHeight + kPointX + 64, kScreenWidth - kPointX * 2, kButtonHeight);
        [_btn1 setTitle:@"turn to OC实践APP" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn1.layer.masksToBounds = YES;
        _btn1.layer.cornerRadius = 8;
        _btn1.tag = 111;
        _btn1.layer.borderColor = [UIColor blueColor].CGColor;
        _btn1.layer.borderWidth = 1;
    }
    return _btn1;
}


- (UIButton *)btn2{
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.frame = CGRectMake(kPointX,64 + kPointX * 3 + kButtonHeight * 2, (kScreenWidth - kPointX * 3)/2, kButtonHeight);
        [_btn2 setTitle:@"toPage1" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
        _btn2.layer.masksToBounds = YES;
        _btn2.layer.cornerRadius = 8;
        _btn2.layer.borderColor = [UIColor blueColor].CGColor;
        _btn2.layer.borderWidth = 1;
    }
    return _btn2;
}

- (UIButton *)btn3{
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.frame = CGRectMake(kPointX +  (kScreenWidth - kPointX * 3)/2 + kPointX, self.btn2.frame.origin.y,  (kScreenWidth - kPointX * 3)/2, kButtonHeight);
        [_btn3 setTitle:@"toPage2" forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
        _btn3.layer.masksToBounds = YES;
        _btn3.layer.cornerRadius = 8;
        _btn3.layer.borderColor = [UIColor blueColor].CGColor;
        _btn3.layer.borderWidth = 1;
    }
    return _btn3;
}
- (void)btnClick:(UIButton *)btn{

    NSString *urlStr = @"MapNewApp://com.born.mapNew";
    if (btn.tag == 111) {
//        urlStr = @"https://itunes.apple.com/cn/app/%E6%94%AF%E4%BB%98%E5%AE%9D-%E8%AE%A9%E7%94%9F%E6%B4%BB%E6%9B%B4%E7%AE%80%E5%8D%95/id333206289?mt=8";
        urlStr = @"InterviewDemo://ZengYan.bu.InterviewDemo";
    }
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{}
                                     completionHandler:^(BOOL success) {
                                         NSLog(@"Open %@: %d",urlStr,success);
                                     }];
        } else {
            // Fallback on earlier versions
        }
    } else {
        BOOL success = [[UIApplication sharedApplication] openURL:url];
        NSLog(@"Open %@: %d",urlStr,success);
    }
}

#pragma mark - 点击事件
- (void)btn2Click{
    [self pushToPageOne];
}

- (void)btn3Click{
    [self pushToPageTwo];
}

#pragma mark - 跳转事件
- (void)pushToPageOne{
    PageOneViewController *oneVc = [[PageOneViewController alloc] init];
    [self.navigationController pushViewController:oneVc animated:YES];
}

- (void)pushToPageTwo{
    PageTwoViewController *twoVC = [[PageTwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
