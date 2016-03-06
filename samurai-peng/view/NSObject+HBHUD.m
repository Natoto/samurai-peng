//
//  UIViewController+HBHUD.m
//  pengmi
//
//  Created by 星盛 on 15/1/25.
//  Copyright (c) 2015年 星盛. All rights reserved.
//
#import "AppDelegate.h"
#import "NSObject+HBHUD.h"
//#import "MBProgressHUD.h"
#import <objc/runtime.h>

#define KEY_OBJECT_HUD @"UIViewController.HBHUD"
#define KEY_HUD @"dismissblock"

@implementation NSObject(HBHUD)
static char OperationKey;
//static char messageTipsKey;

-(void)presentMessageTips:(NSString *)message
{
    [self presentMessageTips_:message];
}

-(void)presentMessageTips:(NSString *)message dismisblock:(void (^)())dismissblock
{
    [self presentMessageTips_:message dismisblock:dismissblock];
}


-(void)presentFailureTips:(NSString *)message
{
     [self presentMessageTips_:message];
}

-(MBProgressHUD *)presentMessageTips_:(NSString *)message
{
    UIView * superview = [self SuperView];
    if(!superview) return nil;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.f;
    hud.yOffset = 0.f;
    hud.removeFromSuperViewOnHide = YES;
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [hud hide:YES];
    });
    return hud;
}


- (void)presentMessageTips_:(NSString *)message dismisblock:(void(^)())dismissblock
{
    UIView * superview = [self SuperView];
    if(!superview) return;
//    superview = superview.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.f;
    hud.yOffset = 0;
//    hud.removeFromSuperViewOnHide = YES;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [hud showAnimated:YES whileExecutingBlock:^{
         [self myTask];
    } onQueue:queue completionBlock:^{
        
        [hud removeFromSuperview];
        dismissblock();
    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [hud hide:YES afterDelay:1];
//         dismissblock();
//    });
}

//- (void)presentLoadingTips:(NSString *)message dismisblock:(void(^)())dismissblock
//{
//    
//    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    [self setHUD:HUD];
//    
//    // Set determinate mode
//    HUD.mode = MBProgressHUDModeDeterminate;
//    
//    HUD.delegate = self;
//    HUD.labelText = message;
//    // myProgressTask uses the HUD instance to update progress
//    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//    });
//}

-(void)presentLoadinghud
{
    UIView * superview = [self SuperView];
    if(!superview) return ;
    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"closeBtn"] forState:UIControlStateNormal];
    button.frame = CGRectMake(5, [UIScreen mainScreen].bounds.size.height - 30, 25, 25);
    [button addTarget:self action:@selector(hideloadingTips:) forControlEvents:UIControlEventTouchUpInside];
    [HUD addSubview:button];
}

-(void)dismissAllTips
{
    UIView * superview = [self SuperView];
    if(!superview) return ;
    [MBProgressHUD hideAllHUDsForView:superview animated:YES];
 
}

-(MBProgressHUD *)presentLoadingTips:(NSString *)message
{
    UIView * superview = [self SuperView];
    if(!superview) return nil;
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:superview animated:YES];
    [self setHUD:HUD];
    HUD.mode = MBProgressHUDModeIndeterminate;//MBProgressHUDModeDeterminate;
    HUD.delegate = self;
    HUD.labelText = message;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"closeBtn"] forState:UIControlStateNormal];
    button.frame = CGRectMake(5, [UIScreen mainScreen].bounds.size.height - 30, 25, 25);
    [button addTarget:self action:@selector(hideloadingTips:) forControlEvents:UIControlEventTouchUpInside];
    [HUD addSubview:button];
    return HUD;
}

-(void)hideloadingTips:(id)sender
{
    MBProgressHUD * hud = [self HUD];
    [hud hide:YES];
}

-(void)dismissTips
{
    MBProgressHUD * hud = [self HUD];
    [hud hide:YES];
}


- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(1);
}
- (void)myProgressTask {
    // This just increases the progress indicator in a loop
    
    MBProgressHUD * hud = [self HUD];
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        hud.progress = progress;
        usleep(50000);
    }
}



-(UIView *)SuperView
{
    UIView * superview = nil;
  if ([[self class] isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController * ctr = (UINavigationController *)self;
        superview = ctr.view;
  }
  else if ([[self class] isSubclassOfClass:[UIViewController class]]) {
      UIViewController * ctr = (UIViewController *)self;
      superview = ctr.view;
   }
  else if ([[self class] isSubclassOfClass:[UIView class]]) {
        UIView * ctr = (UIView *)self;
        superview = ctr;
    }
    else if ([[self class] isSubclassOfClass:[UIWindow class]]) {
        UIWindow * ctr = (UIWindow *)self;
        superview = ctr;
        
    }
    else if ([[self class] isSubclassOfClass:[AppDelegate class]]) {
        AppDelegate * ctr = (AppDelegate *)self;
        superview = ctr.window;
    }
    return superview;
}


-(void)setHUD:(MBProgressHUD *)HUD
{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil)
    {
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &OperationKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:HUD forKey:KEY_HUD];
}

-(MBProgressHUD *)HUD
{
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &OperationKey);
    if(opreations == nil) return nil;
    MBProgressHUD * aHUD = [opreations objectForKey:KEY_HUD];
    return aHUD;
}

@end
