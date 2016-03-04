//
//  LoginViewController.m
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "LoginViewController.h"

#import "Samurai.h"
#import "Samurai_WebCore.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)dealloc
{
    [self unloadTemplate];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadTemplate:@"/www/html/login.html"];
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
