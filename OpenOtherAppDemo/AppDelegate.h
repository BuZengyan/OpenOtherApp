//
//  AppDelegate.h
//  OpenOtherAppDemo
//
//  Created by zengyan.bu on 2018/5/8.
//  Copyright © 2018年 zengyan.bu. All rights reserved.
//  打开其他APPdemo

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong) NSURL *url;

- (void)saveContext;


@end

