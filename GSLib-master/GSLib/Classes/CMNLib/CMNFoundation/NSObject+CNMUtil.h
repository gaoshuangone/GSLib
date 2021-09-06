//
//  NSObject+CNMUtil.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CNMUtil)
//判断一个object是否为空
+ (BOOL)empty:(NSObject *)obj;

/** 不明确类型转为string*/
- (NSString *)toString;

/** 不明确类型转为string*/
- (NSString *)toNumberString;

+(NSString*)toSafeString:(id)string;
//+(NSString*)toSafeStringaaa:(id)string;

//字典转Json字符串
-(NSString *)convertToJsonData:(NSDictionary *)dict;
//JSON字符串转化为字典
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
