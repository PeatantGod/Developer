//
//  TFUserOperation.h
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginHeader.h"
#import "TFUser.h"
#import "TFTableName.h"
@interface TFUserOperation : NSObject

+ (TFUserOperation *)sharedUser;

- (void) loginUserName:(NSString *)name password:(NSString *)password;

- (BOOL) registerUserName:(NSString *)name password:(NSString *)password registerDate:(NSDate *)date;

- (BOOL) operationEmail:(NSString *)str;
- (BOOL) operationPassword:(NSString *)str;
@end
