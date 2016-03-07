//
//  Discovery2ViewController.m
//  samurai-peng
//
//  Created by zeno on 16/3/7.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "Discovery2ViewController.h"
#import "DiscoveryTopicPageModel.h"
#import "SigninModel.h"
#import "GlobalData.h"
#import "ImageCollectionCell.h"
@interface Discovery2ViewController ()

@model( DiscoveryTopicPageModel *,		model );
@end

@implementation Discovery2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    COLLECTIONVIEW_REGISTER_XIB_CELLCLASS(self.collectionView, NSStringFromClass([ImageCollectionCell class]))
    
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 50., 0);
    self.noHeaderFreshView = NO;
    self.noFooterView = NO;
    self.model = [DiscoveryTopicPageModel new];
    [self.model addSignalResponder:self];
    [[SigninModel sharedInstance] addSignalResponder:self];
    @weakify(self)
    
    self.onSignal(SigninModel.loginsuccess,^{ @strongify(self)
        [self refreshView];
    });
    
    self.onSignal(DiscoveryTopicPageModel.eventLoading,^{
        NSLog(@"正在加载中...");
    });
    
    self.onSignal(DiscoveryTopicPageModel.eventLoaded,^{
        @strongify(self)
        [self reloadData];
        [self FinishedLoadData];
    });
    
    self.onSignal(DiscoveryTopicPageModel.eventError,^{
        @strongify(self)
        NSLog(@"请求错误");
        [self FinishedLoadData];
    });
    
}

-(void)refreshView
{
    self.model.fromTopicId = @-1;
    [self.model refresh];
}

-(void)getNextPageView
{
    [self.model refresh];
}

GET_CELL_SELECT_ACTION(cellstruct)
{
    
}

-(NSInteger)configColumnCount
{
    return 3.;
}
- (void)reloadData
{
    [self.model.items enumerateObjectsUsingBlock:^(DiscoveryTopicItem * item, NSUInteger idx, BOOL * _Nonnull stop) {
        CELL_STRUCT * cellstruct = [CELL_STRUCT cell_x_x_struct:nil detailvalue:nil target:self selectAction:DEFAULT_CELL_SELECT_ACTION];
        cellstruct.cellclass = NSStringFromClass([ImageCollectionCell class]);
        cellstruct.picture =[self pengResDataThumbimageurl:item.img];
        cellstruct.cellheight = [self itemWidth];
        [self.dataDictionary setObject:cellstruct forKey:KEY_INDEXPATH(0, idx)];
    }];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 

@end
