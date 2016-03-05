//
//  model.h
//  samurai-peng
//
//  Created by BooB on 16/3/5.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Samurai.h"
#import "SMSLoginReq2.h"
#import "SMSLoginResp2.h"
@interface model : NSObject

@end


@interface LoginModel : SamuraiModel

@prop_strong(NSString *, phone);
@prop_strong(NSString *, password);
@prop_strong( SMSLoginResp2 *,		player )

@signal( eventLoading )
@signal( eventLoaded )
@signal( eventError )

- (void)refresh;

@end

 