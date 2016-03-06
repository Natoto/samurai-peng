//
//  ViewController.m
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "HBNavigationbar.h"
#import "RKTabView.h"
#import "UIView+Transition.h"
#import "PENGClient.h"
typedef enum : NSUInteger {
    ROOT_TYPE_DIS,
    ROOT_TYPE_SQUARE,
    ROOT_TYPE_MINE,
} ROOT_TYPE;
@interface RootViewController ()<RKTabViewDelegate>
@prop_strong(RKTabView * ,tabbar);
@prop_strong(UIView *, currentView);
@end

@implementation RootViewController
@def_prop_strong(RKTabView *, tabbar);


- (void)dealloc
{
    [self unloadTemplate];
}

- (void)viewDidLoad { 
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self loadTemplate:@"/www/html/index.html"];
    self.title = @"PENG";
    [self tabbar];
    [self.navigationbar setrightBarButtonItemWithTitle:@"登录" target:self selector:@selector(login:)];
    [self.view addSubview:self.discoveyctr.view];
    [self.view bringSubviewToFront:self.navigationbar];
    [self.view bringSubviewToFront:self.tabbar];
    
    [PENGClient fetch_PengResourceService:^(NSString *response) {
         
        
    } errorHandler:^(NSError *err) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(IBAction)login:(id)sender
{
    LoginViewController * vc = [LoginViewController new];
    [self.navigationController presentViewController:vc animated:YES completion:^{
        
    }];
}
-(IBAction)navigationbarTap:(id)sender
{
    NSLog(@"%s",__func__);
}

- (void)test1:(SamuraiSignal *)signal
{
    
}

-(void)tabView:(RKTabView *)tabView tabBecameDisabledAtIndex:(int)index tab:(RKTabItem *)tabItem
{
   
}

-(void)tabView:(RKTabView *)tabView tabBecameEnabledAtIndex:(int)index tab:(RKTabItem *)tabItem
{
    UIView * curview ;
    switch (index) {
        case ROOT_TYPE_DIS:
            curview = self.discoveyctr.view;
            break;
        case ROOT_TYPE_SQUARE:
            curview = self.squarectr.view;
            break;
            
        case ROOT_TYPE_MINE:
            break;
        default:
            break;
    }
    if (curview && self.currentView != curview) {
        [self.currentView removeFromSuperview];
        self.currentView = curview;
        [self.view addSubview:self.currentView];
        [self.view transitionFade];
        [self.view bringSubviewToFront:self.navigationbar];
        [self.view bringSubviewToFront:self.tabbar];
    }
}
#pragma mark - setter getter

-(DiscoveryViewController *)discoveyctr
{
    if (!_discoveyctr) {
        DiscoveryViewController * ctr = [DiscoveryViewController new];
        _discoveyctr = ctr;
    }
    return _discoveyctr;
}

-(SquareViewController *)squarectr
{
    if (!_squarectr) {
        _squarectr =[SquareViewController new];
    }
    return _squarectr;
}

-(RKTabView *)tabbar
{
    if (!_tabbar) {
        
        RKTabItem *faxian = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_faxian_chk.png"] imageDisabled:[UIImage imageNamed:@"tab_faxian_unchk.png"]];
        faxian.tabState = TabStateEnabled;
        
        RKTabItem *huodong = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_guangchang_chk.png"] imageDisabled:[UIImage imageNamed:@"tab_guangchang_unchk.png"]];
        
        RKTabItem *wode = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_mine_chk.png"] imageDisabled:[UIImage imageNamed:@"tab_mine_unck.png"]];
        
        RKTabView *_tabViewSocial = [[RKTabView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [RKTabView heightOfTabView], [UIScreen mainScreen].bounds.size.width, [RKTabView heightOfTabView])];
        _tabViewSocial.backgroundColor = [UIColor clearColor];
        _tabViewSocial.anomalyStyle = YES;
        
        if (_tabViewSocial) {
            _tabViewSocial.horizontalInsets = HorizontalEdgeInsetsMake(0, 0);
            _tabViewSocial.drawSeparators = NO;
            _tabViewSocial.delegate = self;
            _tabViewSocial.darkensBackgroundForEnabledTabs = NO;
            [_tabViewSocial setTabItems:@[faxian,huodong, wode]];
            _tabViewSocial.backgroundColor = [UIColor whiteColor];//PENG_COLOR_NAVIGATIONBAR;
            
            _tabViewSocial.anomalyStyle = NO;
        }
        _tabbar = _tabViewSocial;
        [self.view addSubview:_tabbar];
    }
    return _tabbar;
}
@end
