//
//  CNMMacro.h
//  YunMaiDriver
//
//  Created by 高爽 on 17/3/21.
//  Copyright © 2017年 YunMai. All rights reserved.
//

#ifndef CNMMacro_h
#define CNMMacro_h

#pragma mark -颜色
/** RGB*/
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
/** RGB 透明度*/
#define kColorWithRGBWithAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

/** 随机色*/
#define kColorWithRandom [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:0.5]

/** color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式*/
#define kColorWithHex(stringHex)   [UIColor colorWithHexString:stringHex]

#define kColorWithHexAlpha(stringHex,alpha)   [UIColor colorWithHexString:stringHex alpha:alpha]

#define kBlackColor       [UIColor blackColor]
#define kDarkGrayColor    [UIColor darkGrayColor]
#define kLightGrayColor   [UIColor lightGrayColor]
#define kWhiteColor       [UIColor whiteColor]
#define kRedColor         [UIColor redColor]
#define kBlueColor        [UIColor blueColor]
#define kGreenColor       [UIColor greenColor]
#define kCyanColor        [UIColor cyanColor]
#define kYellowColor      [UIColor yellowColor]
#define kMagentaColor     [UIColor magentaColor]
#define kOrangeColor      [UIColor orangeColor]
#define kPurpleColor      [UIColor purpleColor]
#define kBrownColor       [UIColor brownColor]
#define kClearColor       [UIColor clearColor]

#define kColorMmin   kColorWithHex(@"ff6d26")


#define kBoundIngRectWithText(text,SIZE,font)  [text boundingRectWithSize:SIZE options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size;

#pragma mark -属性快速声明

#define PropertyString(s)@property(nonatomic,copy)NSString * s

#define PropertyNSInteger(s)@property(nonatomic,assign)NSIntegers

#define PropertyFloat(s)@property(nonatomic,assign)floats

#define PropertyLongLong(s)@property(nonatomic,assign)long long s

#define PropertyNSDictionary(s)@property(nonatomic,strong)NSDictionary * s

#define PropertyNSArray(s)@property(nonatomic,strong)NSArray * s

#define PropertyNSMutableArray(s)@property(nonatomic,strong)NSMutableArray * s






#pragma mark -判断类型
// Judge whether it is an empty string.
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

// Judge whether it is a nil or null object.
#define kIsEmptyObject(obj) (obj == nil || [obj isKindOfClass:[NSNull class]])

// Judge whether it is a vaid dictionary.
#define kIsDictionary(objDict) (objDict != nil && [objDict isKindOfClass:[NSDictionary class]])

// Judge whether it is a valid array.
#define kIsArray(objArray) (objArray != nil && [objArray isKindOfClass:[NSArray class]])


#pragma mark -屏幕旋转宽高

#define kMainScreenBounds [[UIScreen mainScreen] bounds]
#define kMinScreenWidth  ((kMainScreenBounds.size.width)<(kMainScreenBounds.size.height)?(kMainScreenBounds.size.width):(kMainScreenBounds.size.height))
#define kMinScreenHeight ((kMainScreenBounds.size.height)>(kMainScreenBounds.size.width)?(kMainScreenBounds.size.height):(kMainScreenBounds.size.width))

#pragma mark -判断系统以及版本

#define kIsAtLeastiOSVersion(comVersion)  floorf([[UIDevice currentDevice].systemVersion floatValue]) >= [comVersion  floatValue] ? 1 : 0

#define kIsIphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)

#define kIsIphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)

#define kIsIphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)

#define kIsIphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IOS7_AND_UP (IOS_VERSION >= 7.0)
#define IS_IOS8_AND_UP (IOS_VERSION >= 8.0)
#define IS_IOS9_AND_UP (IOS_VERSION >= 9.0)


/*! 1、获取APP的名字 */
#define kAPP_Name [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleName]

/*! 2、获取APP的版本号 */
#define kAPP_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleVersion]

/*! 3、获取App短式版本号 */
#define kAPP_VersionShort [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleShortVersionString]


#define DEFAULTS [NSUserDefaults standardUserDefaults]

#define WEAKSELF __block typeof(self) __weak weakSelf = self;


#ifndef CNMProperty
#define CNMProperty   @property (nonatomic,copy,readonly)
#endif

#ifndef CNMProperty_N
#define CNMProperty_N   @property (nonatomic,copy)
#endif
/**
 定义LinkBlock方法
 */
#ifndef CNMProperty_F
#define CNMProperty_F @property (nonatomic,assign,readonly)
#endif


#ifndef CNMProperty_F_N
#define CNMProperty_F_N @property (nonatomic,assign)
#endif

#endif /* CNMMacro_h */




