//
//  CNMImageView.m
//  YunMaiQ
//
//  Created by 高爽 on 17/3/3.
//  Copyright © 2017年 XR. All rights reserved.
//

#import "CNMImageView.h"

@implementation CNMImageView


+(instancetype)cnm_ImageViewInitwithSuperView:(UIView*)superView  withBlock:(InitBlock)initBlock withMasonryMake:(MasonryMakeImage)masonryMake{
    CNMImageView* imageView = [[CNMImageView alloc]init];
    initBlock(imageView);
    [superView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        masonryMake(make,imageView);
    }];
    
    return imageView;
}

+(instancetype)cnm_ImageViewInitwithSuperView:(UIView*)superView  withBlock:(InitBlock)initBlock withMasonryMake:(MasonryMakeImage)masonryMake withImageBlock:(ImageBlock)imageBlock{
    
    CNMImageView* imageView =[CNMImageView cnm_ImageViewInitwithSuperView:superView withBlock:initBlock withMasonryMake:masonryMake];
    imageView.imageBlock = imageBlock;
    
    return imageView;
    
}

-(CNMImageView *(^)(NSString *))imageName{
    return ^CNMImageView* (NSString* imageName){
        self.image = [UIImage imageNamed:imageName];
        return self;
    };
}

-(void)setImageBlock:(ImageBlock)imageBlock{
    if (!_imageBlock) {
        self.userInteractionEnabled = YES;
        _imageBlock = imageBlock;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]init];
        [tap addTarget:self action:@selector(target)];
        [self addGestureRecognizer:tap];
    }
}
-(void)target{
    if (_imageBlock) {
        _imageBlock(self);
    }
}
-(CNMImageView *(^)(UIImage *))imageImage{
    return ^CNMImageView* (UIImage * image){
        self.image = image;
        return self;
    };
}

-(CNMImageView *(^)(UIColor *))imageBackgroundColor{
    return ^CNMImageView* (UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}

-(CNMImageView *(^)(UIColor *))image_BorderColor{
    return ^CNMImageView *(UIColor* color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

-(CNMImageView *(^)(CGFloat))image_BorderWidth{
    return ^CNMImageView* (CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}
-(CNMImageView *(^)(NSInteger))imageTag{
    return ^CNMImageView* (NSInteger tag){
        self.tag = tag;
        return self;
    };
    
}

-(CNMImageView *(^)(CGFloat))image_BornerRadius{
    return ^CNMImageView* (CGFloat radius){
        self.layer.cornerRadius = radius;
        return self;
    };
}

-(CNMImageView *(^)(BOOL))image_MaskToBounds{
    return ^CNMImageView* (BOOL isToBounds){
        self.layer.masksToBounds = isToBounds;
        return self;
    };
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
