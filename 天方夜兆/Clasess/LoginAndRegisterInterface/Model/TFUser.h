//
//  TFUser.h
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFUser : NSObject
@property (nonatomic, strong) NSString *userName;

@property (nonatomic, strong) NSString *passwrod;

@property (nonatomic, strong) NSDate *registerDate;

- (instancetype) initWithName:(NSString *)name passwrod:(NSString *)password registerDate:(NSDate *)date;
@end
