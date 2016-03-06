//
//  SigninModel.h
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import "SMSLoginResp2.h"
#import <Foundation/Foundation.h>
#import "Samurai.h"
#import "PENGClient.h"
@interface SigninModel : BaseModel

@prop_strong(NSString *, phone);
@prop_strong(NSString *, password);
@prop_strong( SMSLoginResp2 *,		resp)

@signal( eventLoading )
@signal( eventLoaded )
@signal( eventError )

- (void)refresh;


@end
