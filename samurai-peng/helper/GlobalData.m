//
//  GlobleData.m
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

+(instancetype)sharedInstance {
    static GlobalData *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[GlobalData alloc] init];
    });
    return _sharedClient;
}
@end

@implementation NSObject(pengresource)


/**
 *  获得众筹详情的URL
 *
 *  @param cid 众筹ID
 *
 *  @return 返回众筹详情网页URL
 */
-(NSString * )pengCFinfoUrlWithCid:(NSNumber *)cid
{
    //http://ent.pengpeng.com/peng/chips/众筹id.html
    return [NSString stringWithFormat:@"http:////ent.pengpeng.com//peng//chips//%@.html",cid];
}

/**
 *  查询服务器原图URL
 *
 *  @param imgname 服务器返回的名字
 *
 *  @return 完整的URL
 */
-(NSString *)pengResDataimageurl:(NSString *)imgname
{
    NSString * string = [NSString stringWithFormat:@"%@/%@.jpg",[GlobalData sharedInstance].m_picture_hostfolder,imgname];
    string =  [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return string;
}

/**
 *  查询服务器原视频URL
 *
 *  @param imgname 服务器返回的名字
 *
 *  @return 完整的URL
 */
-(NSString *)pengVideoAccessUrl:(NSString *)videoname
{
    NSString * string = [NSString stringWithFormat:@"%@/%@",[GlobalData sharedInstance].m_videoAccessUrl,videoname];
    string =  [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return string;
}
/**
 * 获取网络图片的SIZE
 * 有保留图片尺寸的imagename 会含有 _宽 x(英文小写)高.jpg字样//注意 ×(中文的乘) X(英文的X大写)
 */
-(CGSize)sizeOfResDataimageurl:(NSString *)imgname
{
    CGSize imagesize = CGSizeZero;
    if ([imgname hasSuffix:@".jpg"]) {
        imgname = [imgname stringByReplacingOccurrencesOfString:@".jpg" withString:@""];
    }
    NSArray * compant = [imgname componentsSeparatedByString:@"_"];
    if (compant.count>=2) {
        NSString * sizestring = compant[1];
        NSLog(@"sizestring = %@",sizestring);
        NSArray * sizecompants = [sizestring componentsSeparatedByString:@"x"];
        if (sizecompants.count == 2) {
            NSString * sizewidthstring = sizecompants[0];
            NSString * sizeheightstring = sizecompants[1];
            imagesize.width = sizewidthstring.floatValue;
            imagesize.height = sizeheightstring.floatValue;
        }
    }
    return imagesize;
}
/**
 *  查询服务器缩略图URL
 *
 *  @param imgname 服务器返回的名字
 *
 *  @return 完整的URL
 */
-(NSString *)pengResDataThumbimageurl:(NSString *)imgname
{
    NSString * string = [NSString stringWithFormat:@"%@/%@_mini.jpg",[GlobalData sharedInstance].m_picture_hostfolder,imgname];
    string =  [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return string;
}


@end