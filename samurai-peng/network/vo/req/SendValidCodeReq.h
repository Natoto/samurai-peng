//  
//  此文件请勿修改，如需扩展请在外部实现

//  
//  SendValidCodeReq.h
//  PENG
//
//  此文件请勿修改，如需扩展请在外部实现.
//  Copyright (c) 2015年 星盛. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Req.h"

@interface SendValidCodeReq : Req

//(必填) 
@property(nonatomic,strong) NSString * deviceToken;
//(必填) 
@property(nonatomic,strong) NSString * deviceOS;
//(必填) 
@property(nonatomic,strong) NSString * chanel;
//(必填) 
@property(nonatomic,strong) NSString * nickName;
//(必填) 
@property(nonatomic,strong) NSString * pasw;
//(必填) 
@property(nonatomic,strong) NSString * mobile;
@end