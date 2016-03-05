//
//  LoginViewController.m
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "model.h"
#import "LoginViewController.h"

#import "Samurai.h"
#import "Samurai_WebCore.h"
@interface LoginViewController ()
{
    UITextField *	_t1;
    UITextField *	_t2;
}

@model( LoginModel *,		loginmodel );
@end

@implementation LoginViewController

@def_model( LoginModel *,		loginmodel );
- (void)dealloc
{
    [self.loginmodel removeSignalResponder:self];
    [self unloadTemplate];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.loginmodel = [LoginModel new];
    [self.loginmodel addSignalResponder:self];
    [self loadTemplate:@"/www/html/login.html"];
    
    self.onSignal(LoginModel.eventLoading,^{
    
        NSLog(@"正在登录中...");
    });
    
    self.onSignal(LoginModel.eventLoaded,^{
        
        NSLog(@"登录成功");
    });
    
    self.onSignal(LoginModel.eventError,^{
        NSLog(@"请求错误");
        
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -

- (void)submitForm
{
 
    BOOL valid = YES;
    if ( 0 == [_t1.text length]) {
        
        $(_t1).ADD_CLASS(@"error");
        valid = NO;
    }
    else
    {
        $(_t1).REMOVE_CLASS(@"error");
        
    }
    
    if ( 0 == [_t2.text length]) {
        
        $(_t2).ADD_CLASS(@"error");
        valid = NO;
    }
    else
    {
        $(_t2).REMOVE_CLASS(@"error");
        
    }
        
    NSLog(@"text: %@ %@",_t1.text,_t2.text);
    self.loginmodel.password = _t2.text;
    self.loginmodel.phone = _t1.text;
    
    if ( NO == valid )
    {
        [[[UIAlertView alloc] initWithTitle:@"Invalid content"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    else
    {
        [self.loginmodel refresh];
//        [[[UIAlertView alloc] initWithTitle:@"Thank you"
//                                    message:nil
//                                   delegate:nil
//                          cancelButtonTitle:@"OK"
//                          otherButtonTitles:nil] show];
 
    }
    
    
}
#pragma mark -

- (void)submit:(SamuraiSignal *)signal
{
    [self submitForm];
}




@end
