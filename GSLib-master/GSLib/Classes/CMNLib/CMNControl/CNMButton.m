//
//  CNMProperty .h
//  Example
//
//  Created by 高爽 on 2017/11/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMButton.h"
#import <objc/runtime.h>
@implementation CNMButton

static char const * const buttonBlockKey = "butBlock";

static char const * const isSoonCliCKLimitKey = "isSoonCliCKLimit";

+(instancetype)cnm_ButonInitwithSuperView:(UIView*)superView with:(void (^)(CNMButton *button))initBlock withMasonryMake:(MasonryMakeButton)masonryMake withButtonBlock:(ButtonBlock)buttonBlock{
    
    CNMButton* button = [CNMButton butonInitWith:initBlock withSuperView:superView withButtonBlock:buttonBlock];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        masonryMake(make,button);
    }];
    return button;
    
}

+(instancetype)butonInitWith:(void(^)(CNMButton* button))initBlock withSuperView:(UIView*)superView withButtonBlock:(ButtonBlock)buttonBlock{
    CNMButton* button = [CNMButton butonInitWith:initBlock withSuperView:superView];
    button.butBlock = buttonBlock;
    
    return button;
    
}

+(instancetype)butonInitWith:(void (^)(CNMButton *))initBlock withSuperView:(UIView *)superView{
    CNMButton* button = [CNMButton buttonWithType:UIButtonTypeCustom];
    
    initBlock(button);
    
    [superView addSubview:button];
    return button;
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}


-(ButtonBlock)butBlock{
    
    return objc_getAssociatedObject(self, buttonBlockKey);
}
-(BOOL)isSoonCliCKLimit{
    
    return objc_getAssociatedObject(self, isSoonCliCKLimitKey);
}

-(void)setButBlock:(ButtonBlock)butBlock{
    
    if ([self butBlock]== nil) {
        objc_setAssociatedObject(self, buttonBlockKey, butBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        // ------默认开启双击限制
        objc_setAssociatedObject(self, isSoonCliCKLimitKey, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self removeTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}
- (void)onClick:(id) sender
{
    if ([self isSoonCliCKLimit]) {
        self.userInteractionEnabled = NO;
        [self performSelector:@selector(timerDelay) withObject:self afterDelay:1.2];
    }
    if (self.butBlock)
    {
        self.butBlock(self);
    }
}
-(void)timerDelay{
    
    self.userInteractionEnabled = YES;
    
}
//-(CNMButton *(^)(NSString *))buttonTitle{
//    return ^CNMButton *(NSString* title){
//        [self setTitle:title forState:UIControlStateNormal];
//        return self;
//    };
//}
//
//-(CNMButton *(^)(UIColor *))buttonTitleColor{
//    return ^CNMButton *(UIColor* color){
//        [self setTitleColor:color forState:UIControlStateNormal];
//        return self;
//    };
//}
-(CNMButton *(^)(NSString *))butNormalTitle{
    return ^CNMButton* (NSString* title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(CNMButton *(^)(NSString *))butSelectTitle{
    return ^CNMButton* (NSString* title){
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(CNMButton *(^)(UIColor *))butNormalTitleColor{
    return ^CNMButton* (UIColor* color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}


-(CNMButton *(^)(UIColor *))butSelectTitleColor{
    return ^CNMButton* (UIColor* color){
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

-(CNMButton *(^)(UIColor *))butBackgroundColor{
    return ^CNMButton *(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}
-(CNMButton *(^)(CGFloat))butTitleFontSize{
    return ^CNMButton *(CGFloat fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(CNMButton *(^)(NSString *))butNormalImageName{
    return ^CNMButton *(NSString* imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}
-(CNMButton *(^)(NSString *))butSelectImageName{
    return ^CNMButton *(NSString* imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}
-(CNMButton *(^)(UIView *))butSuperView{
    return ^CNMButton *(UIView* view){
        [view addSubview:self];
        return self;
    };
}
-(CNMButton *)with{
    return self;
}

-(CNMButton *(^)(NSInteger))butTag{
    return ^CNMButton* (NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(CNMButton *(^)(UIColor *))butLayer_BorderColor{
    return ^CNMButton *(UIColor* color){
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

-(CNMButton *(^)(CGFloat))butLayber_BorderWidth{
    return ^CNMButton* (CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}

-(CNMButton *(^)(CGFloat))butLayer_BornerRadius{
    return ^CNMButton* (CGFloat radius){
        self.layer.cornerRadius = radius;
        return self;
    };
}

-(CNMButton *(^)(BOOL))butLayer_MaskToBounds{
    return ^CNMButton* (BOOL isToBounds){
        self.layer.masksToBounds = isToBounds;
        return self;
    };
}
@end
