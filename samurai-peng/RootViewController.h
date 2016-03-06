//
//  ViewController.h
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DiscoveryViewController.h"
#import "SquareViewController.h"
@interface RootViewController : BaseViewController
@property(nonatomic,strong) DiscoveryViewController * discoveyctr;
@property(nonatomic,strong) SquareViewController    * squarectr;
@end

