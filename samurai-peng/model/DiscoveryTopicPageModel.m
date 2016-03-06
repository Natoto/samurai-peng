//
//  DiscoveryTopicPageModel.m
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//
#import "DiscoveryTopicPageModel.h" 
@implementation DiscoveryTopicPageModel

@def_prop_strong(DiscoveryTopicPageResult *,		resp)
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
    DiscoveryTopicPageReq * req = [[DiscoveryTopicPageReq alloc] init];
    req.fromTopicId = self.fromTopicId;
    req.v = @2;
    req.type = @2;
    [self setReq:req];
    NSDictionary * dic = [req objectDictionary];
    
    [manager POST:PENGAPIBaseURLString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *responsejson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        DiscoveryTopicPageResult *resp = [[DiscoveryTopicPageResult alloc] initWithJSONData:[responsejson dataUsingEncoding:NSUTF8StringEncoding]];
        self.resp = resp;
        [self modelSave];
        [self sendSignal:self.eventLoaded withObject:resp];
        NSLog(@"%@", responsejson);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self sendSignal:self.eventError];
    }];
    [self sendSignal:self.eventLoading];
}


@end
