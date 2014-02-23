//
//  ViewController.m
//  TestPrivate
//
//  Created by ranger on 14-2-23.
//  Copyright (c) 2014年 wym. All rights reserved.
//

#import "ViewController.h"
//@class AADeviceInfo;
//#import <AppleAccount/AADeviceInfo.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(60, 200, 200, 60)];
    [btn setTitle:@"udid" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction
{
//    Class  aa = [NSClassFromString(@"AADeviceInfo") initialize];
//    Class  aa= object_getClass(@"AADeviceInfo");
//     id a = [aa udid];
    NSBundle *a = [NSBundle bundleWithPath:@"System/Library/PrivateFrameworks/AppleAccount.framework"];
    NSBundle *b = [NSBundle bundleWithPath:@"System/Library/PrivateFrameworks/ApplePushService.framework"];
    if ([a load]) {
        if ([b load]) {
            NSLog(@"%s>>>>>>%d",__func__,__LINE__);
            Class aa = NSClassFromString(@"AADeviceInfo");
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, (NSString *)[aa performSelector:@selector(udid)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(productVersion)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(userAgentHeader)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(osVersion)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(appleIDClientIdentifier)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(clientInfoHeader)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(serialNumber)]);
            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(infoDictionary)]);
//            NSLog(@"%s>>>>>>%d>>>>>>%@",__func__,__LINE__, [aa performSelector:@selector(appleIDClientIdentifier)]);
            
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
