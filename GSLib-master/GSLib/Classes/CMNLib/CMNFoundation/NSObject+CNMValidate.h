//
//  NSObject+CNMValidate.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CNMValidate)
/** 是否空数据*/
+ (BOOL)cnm_Validate_checkObjectIsEmpty:(NSObject *)obj error:(NSError **)error strError:(NSString *)strError;

/** 是否纯中文*/
+ (BOOL)cnm_Validate_checkObjectIsChinese:(NSString *)obj error:(NSError **)error strError:(NSString *)strError;

/*!
 *  是否为电话号码【简单写法】
 *
 *  @param phoneNum 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsPhoneNumber:(NSString *)phoneNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  是否为电话号码【复杂写法】
 *
 *  @param mobileNum 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsMobileNumber:(NSString *)mobileNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  判断是否是：移动手机号
 *
 *  @param phoneNum 手机号码
 *
 *  @return 移动手机号
 */
+ (BOOL)cnm_Validate_regularIsChinaMobile:(NSString *)phoneNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  判断是否是：联通手机号
 *
 *  @param phoneNum 手机号码
 *
 *  @return 联通手机号
 */
+ (BOOL)cnm_Validate_regularIsChinaUnicom:(NSString *)phoneNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  判断是否是：电信手机号
 *
 *  @param phoneNum 手机号码
 *
 *  @return 电信手机号
 */
+ (BOOL)cnm_Validate_regularIsChinaTelecom:(NSString *)phoneNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  判断具体是哪个运营商的手机号
 *
 *  @param phoneNum 传入需要检测的字符串
 *
 *  @return 返回：中国移动、中国联通、中国电信、未知
 */
//+ (NSString *)cnm_Validate_getPhoneNumType:(NSString *)phoneNum error:(NSError **)error strError:(NSString *)strError;

/*!
 *  检测是否为邮箱
 *
 *  @param emailStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsEmailQualified:(NSString *)emailStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  检测用户输入密码是否以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
 *
 *  @param passwordStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsPasswordQualified:(NSString *)passwordStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证身份证号（15位或18位数字）【最全的身份证校验，带校验位】
 *  @param idCardNumberStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsIdCardNumberQualified:(NSString *)idCardNumberStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证IP地址（15位或18位数字）
 *  @param iPAddressStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsIPAddress:(NSString *)iPAddressStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证输入的是否全为数字
 *  @param allNumberStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsAllNumber:(NSString *)allNumberStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证由26个英文字母组成的字符串
 *  @param englishAlphabetStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsEnglishAlphabet:(NSString *)englishAlphabetStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证输入的是否是URL地址
 *  @param urlStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsUrl:(NSString *)urlStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证输入的是否是中文
 *  @param chineseStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsChinese:(NSString *)chineseStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  验证输入的是否是高亮显示
 *  @param normalStr 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsNormalText:(NSString *)normalStr highLightText:(NSString *)highLightStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  是否为常用用户名（根据自己需求改）
 *
 *  @param userNameStr userNameStr
 *
 *  @return 返回检测结果 是或者不是（8-20位数字+字母组合）
 */
+ (BOOL)cnm_Validate_regularIsUserNameInGeneral:(NSString *)userNameStr error:(NSError **)error strError:(NSString *)strError;

/*!
 *  车牌号验证
 *
 *  @param carNumber carNumber
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsValidateCarNumber:(NSString *)carNumber error:(NSError **)error strError:(NSString *)strError;

/*!
 *  车型验证
 *
 *  @param CarType CarType
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsValidateCarType:(NSString *)CarType error:(NSError **)error strError:(NSString *)strError;

/*!
 *  昵称验证
 *
 *  @param nickname nickname
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)cnm_Validate_regularIsValidateNickname:(NSString *)nickname error:(NSError **)error strError:(NSString *)strError;

/*!
 *  邮政编码验证
 */
+ (BOOL)cnm_Validate_regularIsValidPostalcode:(NSString *)postalcode error:(NSError **)error strError:(NSString *)strError;

/*!
 *  工商税号验证
 */
+ (BOOL)cnm_Validate_regularIsValidTaxNo:(NSString *)taxNo error:(NSError **)error strError:(NSString *)strError;

/*!
 *  Mac地址有效性验证
 */
+ (BOOL)cnm_Validate_regularIsMacAddress:(NSString *)macAddress error:(NSError **)error strError:(NSString *)strError;

/*!
 *  银行卡的有效性验证
 */
+ (BOOL)cnm_Validate_regularIscnmnkCardlNumCheck:(NSString *)cnmnkCardlNum error:(NSError **)error strError:(NSString *)strError;

/*! 判断字符串是否是字母或数字 */
+ (BOOL)cnm_Validate_regularIsLetterOrNumberString:(NSString *)string error:(NSError **)error strError:(NSString *)strError;


@end
