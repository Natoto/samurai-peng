//
//  NSObject+HBHUD.h
//  pengmi
//
//  Created by 星盛 on 15/1/25.
//  Copyright (c) 2015年 星盛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@class MBProgressHUD;
@interface NSObject(HBHUD)<MBProgressHUDDelegate>

-(MBProgressHUD *)presentMessageTips_:(NSString *)message;

- (void)presentMessageTips_:(NSString *)message dismisblock:(void(^)())dismissblock;

-(void)presentFailureTips:(NSString *)message;

-(void)presentMessageTips:(NSString *)message;
- (void)presentMessageTips:(NSString *)message dismisblock:(void(^)())dismissblock;
-(MBProgressHUD *)presentLoadingTips:(NSString *)message;
-(void)dismissTips;

-(void)presentLoadinghud;
-(void)dismissAllTips;

@end
