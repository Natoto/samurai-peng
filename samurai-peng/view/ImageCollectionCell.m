//
//  ImageCollectionCell.m
//  samurai-peng
//
//  Created by zeno on 16/3/7.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "ImageCollectionCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setcellProfile:(NSString *)profile
{
    if (profile && [profile hasPrefix:@"http"]) {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:profile]];
    }
}
@end
