//
//  BaseViewController.h
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBNavigationbar.h"
#import "NSObject+HBHUD.h"
#import "Samurai.h"
#import "Samurai_WebCore.h"

@interface BaseViewController : UIViewController
@property(nonatomic,assign) BOOL showBackItem;
@property(nonatomic,strong) HBNavigationbar * navigationbar;
-(void)backtoparent:(id)sender andRefresh:(BOOL)refresh;
-(IBAction)backtoparent:(id)sender;
@end
