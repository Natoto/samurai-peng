//
//  ViewController.m
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "Samurai.h"
#import "Samurai_WebCore.h"
@interface RootViewController ()

@end

@implementation RootViewController


- (void)dealloc
{
    [self unloadTemplate];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadTemplate:@"/www/html/index.html"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test1:(SamuraiSignal *)signal
{
    
    LoginViewController * vc = [LoginViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
//    [[[UIAlertView alloc] initWithTitle:@"Button 1 was clicked"\
                                message:nil\
                               delegate:nil\
                      cancelButtonTitle:@"OK"\
                      otherButtonTitles:nil] show];
    
    
}

@end
