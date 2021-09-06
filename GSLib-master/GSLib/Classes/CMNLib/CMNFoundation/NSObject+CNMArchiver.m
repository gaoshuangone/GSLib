//
//  NSObject+CNMArchiver.m
//  YunMaiDriver
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 YunMai. All rights reserved.
//

#import "NSObject+CNMArchiver.h"
#define kUserDefaultsKey(keyString) [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.data",keyString]]
@implementation NSObject (CNMArchiver)
// 保存数据——NSUserDefaults
+ (void)cnm_Archiver_userDefaultSetObj:(id)object forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

// 取得数据——NSUserDefaults
+ (id)cnm_Archiver_userDefaultGetObjForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

// 删除数据——NSUserDefaults
+ (void)cnm_Archiver_userDefaultDelObjForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)cnm_Archiver_userDefaultArraySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableArray* mArray))block{
    NSMutableArray* arrayM  = nil;
    NSArray* array =   [NSUserDefaults cnm_Archiver_userDefaultGetObjForKey:key];
    
    arrayM = (array?[NSMutableArray arrayWithArray:array]:[NSMutableArray arrayWithCapacity:0]);

    if (block) {
        block(arrayM);
    }
    
    [NSUserDefaults cnm_Archiver_userDefaultSetObj:arrayM forKey:key];
    
}

+ (void)cnm_Archiver_userDefaultDictonryySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableDictionary* mDit))block{
    NSMutableDictionary* arrayM  = nil;
    NSDictionary* array =   [NSUserDefaults cnm_Archiver_userDefaultGetObjForKey:key];
    
    arrayM = (array?[NSMutableDictionary dictionaryWithDictionary:array]:[NSMutableDictionary dictionaryWithCapacity:0]);
    
    
    if (block) {
        block(arrayM);
    }
    
    [NSUserDefaults cnm_Archiver_userDefaultSetObj:arrayM forKey:key];
}

//NSUserDefaults只能储存基本数据类型，这里用NSKeyedArchiver储存
+(void)cnm_Archiver_DictonryySetObjforKey:(NSString *)key withBlock:(void (^)(NSMutableDictionary* mDit))block{
    
    NSMutableDictionary* dictM  = [NSKeyedUnarchiver unarchiveObjectWithFile:kUserDefaultsKey(key)];
    if (!dictM) {
        dictM = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    if (block) {
        block(dictM);
    }
    
    [NSKeyedArchiver archiveRootObject:dictM toFile:kUserDefaultsKey(key)];
}

@end
