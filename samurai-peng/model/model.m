//
//  model.m
//  samurai-peng
//
//  Created by BooB on 16/3/5.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "NSObject+ObjectMap.h"
#import "STIHTTPNetwork.h"
#import "model.h"
#import "PENGClient.h"
@implementation model

@end




@interface LoginModel ()
@property (nonatomic, strong) HBHTTPApi * api;
@end

@implementation LoginModel

@def_prop_strong( PengLoginResp *,		player )

@def_signal( eventLoading )
@def_signal( eventLoaded )
@def_signal( eventError )

- (id)init
{
    self = [super init];
    if ( self )
    {
    }
    return self;
}

- (void)dealloc
{ 
}

#pragma mark -

- (void)modelLoad
{
}

- (void)modelSave
{
}

- (void)modelClear
{
}

#pragma mark -

- (void)refresh
{
    
    PENGClient *manager = [PENGClient sharedClient];
   
    SMSLoginReq2 * req = [[SMSLoginReq2 alloc] init];
    req.deviceOS = @"ios";
    req.mobile = self.phone;
    req.deviceToken = @"pengpengDeviceToken";
    req.regCode = self.password;
    req.msgType = NSStringFromClass([SMSLoginReq2 class]);
    NSDictionary * dic = [req objectDictionary];
 
//    // 设置请求格式
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    // 设置返回格式
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:PENGAPIBaseURLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
         [self sendSignal:self.eventLoaded];
        NSLog(@"%@", result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          [self sendSignal:self.eventError];
    }];
    [self sendSignal:self.eventLoading];
    
//    [self.api cancel];
//    
//    
//    HBHTTPApi * api = [[HBHTTPApi alloc] init];
//    api.method = STIHTTPRequestMethodPost;
//    
//    @weakify( self );
//    api.responseClass = [SMSLoginResp2 class];
//    SMSLoginReq2 * req = [[SMSLoginReq2 alloc] init];
//    req.deviceOS = @"ios";    
//    req.mobile = self.phone;
//    req.deviceToken = @"pengpengDeviceToken";
//    req.regCode = self.password;
//    req.msgType = NSStringFromClass([SMSLoginReq2 class]);
//    NSDictionary * dic = [req objectDictionary];
//    api.parameters = dic;
//    api.endpoint = @"";
//    
//    api.whenUpdated = ^( SMSLoginResp2 * resp, id error ) {
//        
//        @strongify( self );
//        
//        if ( resp )
//        {
//            self.player = resp;
//            
//            [self modelSave];
//            
//            [self sendSignal:self.eventLoaded];
//        }
//        else
//        {
//            [self sendSignal:self.eventError];
//        }
//    };
//    
//    self.api = api;
//    
//    [api send];
//    
//    [self sendSignal:self.eventLoading];
}

@end
