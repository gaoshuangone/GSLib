//
//  CNMHelperProtocol.h
//  YunMaiDriver
//
//  Created by 高爽 on 2017/9/20.
//  Copyright © 2017年 YunMai. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HELPER_SHARED(CLASS) +(instancetype)shared{ \
static CLASS *sharedHelper = nil;\
static dispatch_once_t predicate;\
dispatch_once(&predicate, ^{\
sharedHelper = [[CLASS alloc] init];\
});\
return sharedHelper;}

/**
 * 单例统一接口协议
 */
@protocol CNMHelperProtocol <NSObject>
+(instancetype)shared;
@end
