//
//  DiscoveryViewController.m
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "model.h"
@interface DiscoveryViewController ()

@model( DiscoveryTopicPageModel *,		model );
@end

@implementation DiscoveryViewController
@def_model(DiscoveryTopicPageModel, model)

@def_outlet(RefreshCollectionView *,	list );
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTemplate:@"/www/html/find.html"];
    self.list.contentInset = UIEdgeInsetsMake(64, 0, 50., 0);
    
    self.model = [DiscoveryTopicPageModel new];
    [self.model addSignalResponder:self];
    @weakify(self)
    
    self.onSignal( RefreshCollectionView.eventPullToRefresh, ^{
        @strongify( self );
        
        [self refresh];
    });
    
    self.onSignal( RefreshCollectionView.eventLoadMore, ^{
        
        @strongify( self );
        
        [self loadMore];
    });
    
    
    self.onSignal(DiscoveryTopicPageModel.eventLoading,^{
        NSLog(@"正在登录中...");
    });
    
    self.onSignal(DiscoveryTopicPageModel.eventLoaded,^{
        @strongify(self)
        [self dismissAllTips];
        [self reloadData];
        [self.list stopLoading];
    });
    
    self.onSignal(DiscoveryTopicPageModel.eventError,^{
        @strongify(self)
        [self dismissAllTips];
        NSLog(@"请求错误");
        [self.list stopLoading];
    });
    [self.model refresh];     
    // Do any additional setup after loading the view.
}

- (void)refresh
{
    self.model.fromTopicId = @-1;
    [self.model refresh];
}

- (void)loadMore
{
//    if ( [self.model more] )
//    {
//        [_currentModel loadMore];
//    }
//    else
//    {
//        [self.list stopLoading];
//    }
}


- (void)reloadData
{
    self.scope[ @"list" ] = @{
                              @"section-shots" : ({
                                  NSMutableArray * shots = [NSMutableArray array];
                                  for (DiscoveryTopicItem * item in self.model.resp.list)
                                  {
                                       [shots addObject : [self pengResDataThumbimageurl:item.img]];
                                  }
                                  shots;
                              })
                              };
    
    [self relayout];
    
}

- (void)viewShot:(SamuraiSignal *)signal
{
    NSLog(@"%s %ld",__func__,signal.sourceIndexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
