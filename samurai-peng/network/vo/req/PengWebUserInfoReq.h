//  
//  此文件请勿修改，如需扩展请在外部实现

//  
//  PengWebUserInfoReq.h
//  PENG
//
//  此文件请勿修改，如需扩展请在外部实现.
//  Copyright (c) 2015年 星盛. All rights reserved.
//
//所属模块：帐号
//说明：
/******************
碰碰网用户信息 
*******************/
#import <Foundation/Foundation.h>
#import "Req.h"

@interface PengWebUserInfoReq : Req

//碰用户Id(必填) 
@property(nonatomic,strong) NSNumber * pengId;
//手机(必填) 
@property(nonatomic,strong) NSString * mobile;
@end