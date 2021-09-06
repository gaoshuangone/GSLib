//
//  CNMlab.h
//  Example
//
//  Created by 高爽 on 2017/11/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
#import "CNMMacro.h"


typedef enum
{
    VerticalAlignmentTop = 0, // 距上对齐
    VerticalAlignmentMiddle,  //居中对齐
    VerticalAlignmentBottom,  //距下对齐
} TextAlignmentVertical;

@interface CNMLabel : UILabel

typedef void(^MasonryMake)(MASConstraintMaker *make, CNMLabel* cnm);
/** test*/
CNMProperty  CNMLabel* (^labText)(NSString* text);

CNMProperty  CNMLabel* (^labSuperView)(UIView* view);

@property (nonatomic, strong)CNMLabel* with;

CNMProperty  CNMLabel* (^labTextColor)(UIColor* color);

CNMProperty  CNMLabel* (^labBackgroundColor)(UIColor* color);

CNMProperty  CNMLabel* (^labFont)(CGFloat fontSize);

CNMProperty  CNMLabel* (^labBoldFont)(CGFloat fontSize);

/** 对齐方式，水平方向*/
CNMProperty  CNMLabel* (^labTextAlignment)(NSTextAlignment textAlignment);

/** 对齐方式，垂直方向*/
CNMProperty  CNMLabel* (^labTextAlignmentVertical)(TextAlignmentVertical);

CNMProperty  CNMLabel* (^labNumberLines)(NSInteger NumberLine);

/** (NSString* text,UIColor* color,CGFloat fontSize)*/
CNMProperty  CNMLabel* (^labCommon)(NSString* text,UIColor* color,CGFloat fontSize);

/** masonry约束时的sizeFree*/
CNMProperty  CNMLabel* (^labSizeFree)(CGSize size);

/** masonry约束时的sizeFree*/
CNMProperty_F_N CGSize sizeFree;

/** 对齐方式，垂直方向*/
CNMProperty_F_N TextAlignmentVertical textAlignmentvertical;

/** 如果用sizefree设置的size更新的时候用labTextUpdate方法*/
CNMProperty NSString* labTextUpdate;

/** 去除警告*/
-(void)free;

/** 约束更新labtext*/
-(void)setlabTextUpdate:(NSString *)labTextUpdate;

/**
 * superView    视图所在的superView
 * initBlock    设置基础属性
 * masonryMake  约束
 */
+(instancetype)cnm_LabInitWithSuperView:(UIView*)superView withBlock:(void (^)(CNMLabel *cnm))initBlock withlabWithMas_makeConstraints:(MasonryMake)masonryMake;

/** 设置某段字的颜色，保留最后一次*/
- (void)setColor:(UIColor *)color fromIndex:(NSInteger)location length:(NSInteger)length;

/** 设置某段字的字体，保留最后一次*/
- (void)setFont:(UIFont *)font fromIndex:(NSInteger)location length:(NSInteger)length;

/** 设置某段字的风格，保留最后一次*/
- (void)setStyle:(CTUnderlineStyle)style fromIndex:(NSInteger)location length:(NSInteger)length;

/**
 * imageName    图片name
 * bounds       图片的边界
 * index        需要insert到text中的位置
 * leftcount    图片距离text(图片最左边时不可设置)
 * rightCount   图片距离text(图片最右边时不可设置)
 * 注意  加入图片后sizeFree.wide过短的情况，设置Masonry中提前加上图片宽度和空格
 */
-(void)cnm_getImageAttributedStringWithImageName:(NSString*)imageName withBounds:(CGRect)bounds  withInsertIndex:(NSInteger)index withEmptyStringLeftCount:(NSInteger)leftcount withEmptyStringRightCount:(NSInteger)rightCount;

/** 设置labAttributedString*/
-(void)setlabAttributedString;

/** 获取自适应的size*/
-(CGSize)sizeConfirmToSize:(CGSize)size;
@end
