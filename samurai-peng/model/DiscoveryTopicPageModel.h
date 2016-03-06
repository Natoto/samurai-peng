//
//  DiscoveryTopicPageModel.h
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoveryTopicPageReq.h"
#import "DiscoveryTopicPageResult.h"
#import "DiscoveryTopicItem.h"
#import "TopicImageRp.h"

#import "Samurai.h"
#import "PENGClient.h"
@interface DiscoveryTopicPageModel : BaseModel

@prop_strong(NSNumber *, fromTopicId);
@prop_strong(DiscoveryTopicPageResult *,resp)
@signal( eventLoading )
@signal( eventLoaded )
@signal( eventError )

- (void)refresh;
@end
