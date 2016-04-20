//
//  TFUserOperation.m
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import "TFUserOperation.h"

@implementation TFUserOperation

static TFUserOperation *sharedUser = nil;

+ (TFUserOperation *)sharedUser{
    dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedUser = [[super alloc] init];
    });
    return sharedUser;
}

- (void) loginUserName:(NSString *)name password:(NSString *)password{
    BmobQuery *query = [BmobQuery queryWithClassName:userTable];
    [query whereKey:userName equalTo:name];
    [query whereKey:userPassword equalTo:password];
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        
//    });
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (array.count > 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationLoginOperation" object:nil userInfo:@{@"oper":@1}];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationLoginOperation" object:nil userInfo:@{@"oper":@0}];
        }
    }];}

- (BOOL) registerUserName:(NSString *)name password:(NSString *)password registerDate:(NSDate *)date{
    BmobObject *insertUser = [BmobObject objectWithClassName:userTable];
    [insertUser setObject:name forKey:userName];
    [insertUser setObject:password forKey:userPassword];
    [insertUser setObject:date forKey:userRegisterDate];
    __block BOOL registerYes = NO;
    [insertUser saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSLog(@"注册成功");
            registerYes = YES;
        }else{
            NSLog(@"----错误信息%@",error);
        }
    }];
    return registerYes;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
}
- (BOOL) operationEmail:(NSString *)str{
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGULER_EMAIL];
    return [pred evaluateWithObject:str];
}
- (BOOL) operationPassword:(NSString *)str{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGULER_PASSWORD];
    return [pred evaluateWithObject:str];
}
@end
