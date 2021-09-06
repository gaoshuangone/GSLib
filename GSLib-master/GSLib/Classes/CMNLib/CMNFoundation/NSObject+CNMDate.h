//
//  NSObject+CNMDate.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CNMDate)
/*
 Date 转换 NSString (默认格式：@"yyyy-MM-dd HH:mm:ss")
 */
+ (NSString *)cnm_Date_getStringForDate:(NSDate *)date;

/**
 获取当前时间（YYYY-MM-dd HH:mm:ss）
 */
+(NSString*)cnm_Date_geStringtCurrentTimes;

/*
 Date 转换 NSString (默认格式：自定义)
 */
+ (NSString *)cnm_Date_getStringForDate:(NSDate *)date format:(NSString *)format;

/*
 NSString 转换 Date (默认格式：@"yyyy-MM-dd HH:mm:ss")
 */
+ (NSDate *)cnm_Date_getDateForString:(NSString *)string;

/*
 NSString 转换 Date (默认格式：自定义)
 */


+ (NSDate *)cnm_Date_getDateForString:(NSString *)string format:(NSString *)format;
/*
 时间戳 转换 Date (默认格式：自定义)
 */
//+(NSString*)cnm_getDateForStringTime:(NSString*)stringTie;
/*
 时间戳 转换 string (默认格式：自定义) format自定义
 */
+(NSString*)cnm_Date_getDateForStringIntegerTime:(NSTimeInterval)stringIntegerTie withFormat:(NSString*)format;


/*
 NSString 转换  format自定义格式string(默认格式：@"yyyy-MM-dd HH:mm:ss")
 */
+(NSString*)cnm_Date_getDateForStringTime:(NSString*)stringTie withFormat:(NSString*)format;


/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param format1     上次日期格式
 *  @param currentTime 最近日期(需要和格式对应)
 *  @param format2     最近日期格式
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)cnm_Date_timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2;
/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param currentTime 最近日期(需要和格式对应)
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)cnm_Date_timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime;

/*
 返回今天昨天明天
 */
+(NSString *)cnm_Date_compareDate:(NSDate *)date;
@end
