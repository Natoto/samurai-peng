//
//  main.m
//  samurai-peng
//
//  Created by zeno on 16/3/4.
//  Copyright © 2016年 peng. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "samurai.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if DEBUG
        [[SamuraiWatcher sharedInstance] watch:@(__FILE__)];
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
