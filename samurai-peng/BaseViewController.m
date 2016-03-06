//
//  BaseViewController.m
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "BaseViewController.h"
#define KT_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(HBNavigationbar *)navigationbar
{
    if (!_navigationbar) {
        _navigationbar = [HBNavigationbar navigationbar];
        _navigationbar.backgroundColor = KT_HEXCOLOR(0xffb612);
        [self.view addSubview:_navigationbar];
    }
    return _navigationbar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitle:(NSString *)title
{
    self.navigationbar.title = title;
}

-(void)backtoparent:(id)sender andRefresh:(BOOL)refresh
{
    if (self.navigationController.childViewControllers.count >1 && self.navigationController.topViewController == self) {
        [self.navigationController popViewControllerAnimated:YES];
        if (refresh) {
            BaseViewController * ctr = (BaseViewController *)self.navigationController.topViewController;
//            [ctr refreshView];
        }
        return;
    }
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:NULL];
        if (refresh) {
            BaseViewController * ctr = (BaseViewController *)self.navigationController.topViewController;
//            [ctr refreshView];
        }
    }
}


-(void)setShowBackItem:(BOOL)showBackItem
{
    _showBackItem = showBackItem;
    //TODO:设置返回按钮
    if (_showBackItem) {
        [self.navigationbar setleftBarButtonItemWithImage:[UIImage imageNamed:@"white_back_btn"] target:self selector:@selector(backtoparent:)];
    }
    else
    {
        self.navigationbar.leftItem = nil;
    }
}
-(IBAction)backtoparent:(id)sender
{
    [self backtoparent:sender andRefresh:NO];
}


@end
