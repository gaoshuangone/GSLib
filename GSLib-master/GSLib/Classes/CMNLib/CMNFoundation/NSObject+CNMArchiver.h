//
//  NSObject+CNMArchiver.h
//  YunMaiDriver
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 YunMai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CNMArchiver)
// 保存数据——NSUserDefaults
+ (void)cnm_Archiver_userDefaultSetObj:(id)object forKey:(NSString *)key;
//
// 取得数据——NSUserDefaults
+ (id)cnm_Archiver_userDefaultGetObjForKey:(NSString *)key;
//
// 删除数据——NSUserDefaults
+ (void)cnm_Archiver_userDefaultDelObjForKey:(NSString *)key;

// 保存数组   mArray即将储存的数组
+ (void)cnm_Archiver_userDefaultArraySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableArray* mArray))block;

+ (void)cnm_Archiver_userDefaultDictonryySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableDictionary* mDit))block;


+(void)cnm_Archiver_DictonryySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableDictionary* mDit))block;

@end
