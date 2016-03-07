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
#import "Discovery2ViewController.h"

@interface RootViewController : BaseViewController
@property(nonatomic,strong) DiscoveryViewController * discoveyctr;
@property(nonatomic,strong) SquareViewController    * squarectr;
@property(nonatomic,strong) Discovery2ViewController * minectr;
@end

