//
//  TFUser.m
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import "TFUser.h"

@implementation TFUser

- (instancetype) initWithName:(NSString *)name passwrod:(NSString *)password registerDate:(NSDate *)date{
    
    _userName = name;
    _passwrod = password;
    _registerDate = date;
    return self;
}
@end
