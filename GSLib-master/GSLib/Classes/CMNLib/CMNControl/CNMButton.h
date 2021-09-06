//
//  CNMProperty .h
//  Example
//
//  Created by 高爽 on 2017/11/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "CNMMacro.h"

@interface CNMButton : UIButton
typedef void(^ButtonBlock)(CNMButton* button);
typedef void(^MasonryMakeButton)(MASConstraintMaker *make,CNMButton* cnm);

/*默认限制连点*/
@property (assign,nonatomic) BOOL isSoonCliCKLimit;

CNMProperty  CNMButton* (^butNormalTitle)(NSString*);

CNMProperty  CNMButton* (^butSelectTitle)(NSString*);

CNMProperty  CNMButton* (^butNormalTitleColor)(UIColor*);

CNMProperty  CNMButton* (^butSelectTitleColor)(UIColor*);

CNMProperty  CNMButton* (^butNormalImageName)(NSString*);

CNMProperty  CNMButton* (^butSelectImageName)(NSString*);

CNMProperty  CNMButton* (^butTitleFontSize)(CGFloat);

CNMProperty  CNMButton* (^butBackgroundColor)(UIColor*);

CNMProperty  CNMButton* (^butSuperView)(UIView*);

CNMProperty  CNMButton* with;

CNMProperty  CNMButton* (^butTag)(NSInteger tag);

CNMProperty_N  ButtonBlock  butBlock;

CNMProperty  CNMButton* (^butLayer_BornerRadius)(CGFloat);

CNMProperty  CNMButton* (^butLayer_MaskToBounds)(BOOL);

CNMProperty  CNMButton* (^butLayber_BorderWidth)(CGFloat);

CNMProperty  CNMButton* (^butLayer_BorderColor)(UIColor*);


+(instancetype)cnm_ButonInitwithSuperView:(UIView*)superView with:(void (^)(CNMButton *button))initBlock withMasonryMake:(MasonryMakeButton)masonryMake withButtonBlock:(ButtonBlock)buttonBlock ;


@end
