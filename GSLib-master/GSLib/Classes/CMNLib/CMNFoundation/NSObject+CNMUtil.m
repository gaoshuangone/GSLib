//
//  NSObject+CNMUtil.m
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "NSObject+CNMUtil.h"

@implementation NSObject (CNMUtil)
+ (BOOL)empty:(NSObject *)obj{
    if (obj==nil) {
        return YES;
    }
    if (obj==NULL) {
        return YES;
    }
    if (obj==[NSNull new]) {
        return YES;
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [NSString ls_isValidString:(NSString *)obj];
    }
    if ([obj isKindOfClass:[NSData class]]) {
        return [((NSData *)obj) length]<=0;
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)obj) count]<=0;
    }
    if ([obj isKindOfClass:[NSArray class]]) {
        return [((NSArray *)obj) count]<=0;
    }
    if ([obj isKindOfClass:[NSSet class]]) {
        return [((NSSet *)obj) count]<=0;
    }
    return NO;
}
+ (BOOL)ls_isValidString:(NSString *)string {
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if (    [string isEqual:nil]
        ||  [string isEqual:Nil]){
        return YES;
    }
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (0 == [string length]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    if([string isEqualToString:@"(null)"]){
        return YES;
    }
    if ([string isEqualToString:@"nullnull"]) {
        return YES;
    }
    
    return NO;
}


- (NSString *)toString
{
    
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    if (self == nil) {
        return @"";
    }
    else if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *object = (NSNumber *)self;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        return [formatter stringFromNumber:object];
        
    }
    else {
        return [NSString stringWithFormat:@"%@", self];
    }
    //==nil类型不会掉用到toString
}
- (NSString *)toNumberString
{
    if ([[self toString]isEqualToString:@""]) {
        return @"0";
    }
    return [self toString];
}

//不支持BOOL类型
+(NSString*)toSafeString:(id)string{
    if (string&&[string isKindOfClass:[NSString class]]&&![NSString ls_isValidString:string]) {
        return [NSString stringWithFormat:@"%@", string];
    }else if(string && [string isKindOfClass:[NSNumber class]]){
        NSNumber *object = (NSNumber *)string;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        return [formatter stringFromNumber:object];
    }
    
    return @"";
}
//字典转Json字符串
-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
//JSON字符串转化为字典
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
