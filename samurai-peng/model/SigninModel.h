//
//  SigninModel.h
//  samurai-peng
//
//  Created by BooB on 16/3/6.
//  Copyright © 2016年 peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Samurai.h"
#import "PENGClient.h"

#import "SMSLoginResp2.h"
#import "PassportLoginResp.h"

@interface SigninModel : BaseModel
@singleton(SigninModel)
@prop_strong(NSString *, phone);
@prop_strong(NSString *, password);
@prop_strong( SMSLoginResp2 *,		resp)

@signal( eventLoading )
@signal( eventLoaded )
@signal( eventError )

@signal( loginsuccess )
- (void)refresh;


-(void)req_PassportLoginWithMobile:(NSString *)mobile
                          passport:(NSString *)passport
                          response:(void (^)(PassportLoginResp * response))response
                      errorHandler:(void (^)(NSError * error))err;
@end
