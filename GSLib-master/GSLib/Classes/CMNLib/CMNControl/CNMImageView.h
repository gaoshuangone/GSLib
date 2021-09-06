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

@interface CNMImageView  : UIImageView
typedef void (^MasonryMakeImage)(MASConstraintMaker *make,CNMImageView * cnm);
typedef void (^ImageBlock)(CNMImageView * imageView);
typedef void (^InitBlock)(CNMImageView * cnm);

CNMProperty CNMImageView * (^imageImage)(UIImage* image);

CNMProperty CNMImageView * (^imageBackgroundColor)(UIColor* color);

CNMProperty MasonryMakeImage masonryMakeImage;

CNMProperty ImageBlock imageBlock;

CNMProperty InitBlock initBlock;

CNMProperty CNMImageView * (^image_BornerRadius)(CGFloat radius);

CNMProperty CNMImageView * (^image_MaskToBounds)(BOOL isToBounds);

CNMProperty CNMImageView * (^image_BorderWidth)(CGFloat width);

CNMProperty CNMImageView * (^image_BorderColor)(UIColor* color);

CNMProperty CNMImageView * (^imageTag)(NSInteger tag);


+(instancetype)cnm_ImageViewInitwithSuperView:(UIView*)superView  withBlock:(InitBlock)initBlock  withMasonryMake:(MasonryMakeImage)masonryMake;


+(instancetype)cnm_ImageViewInitwithSuperView:(UIView*)superView  withBlock:(InitBlock)initBlock withMasonryMake:(MasonryMakeImage)masonryMake withImageBlock:(ImageBlock)imageBlock;

@end
