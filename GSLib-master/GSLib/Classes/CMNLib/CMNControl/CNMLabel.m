//
//  CNMlab.m
//  Example
//
//  Created by 高爽 on 2017/11/1.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMLabel.h"


@interface CNMLabel()

@property (strong, nonatomic)NSMutableAttributedString* attributedString;
@property (assign, nonatomic)CGSize sizeFreeTemp;//labTextUpdate保留init设置的sizeFree

@property (assign)UIEdgeInsets edgeInsetsTmp;
@end
@implementation CNMLabel
+(instancetype)labInitWith:(void (^)(CNMLabel *lab))initBlock{
    
    CNMLabel* lab = [[CNMLabel alloc]init];
    [lab setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    lab.textAlignmentvertical = VerticalAlignmentMiddle;
    initBlock(lab);
    
    if (lab.superview == nil) {
        //        NSAssert(0, @"未设置superview");
    }
    return lab;
}
+(instancetype)cnmLabInitWithSuperView:(UIView*)superView withBlock:(void (^)(CNMLabel *lab))initBlock{
    
    CNMLabel* labInit =[self labInitWith:initBlock];
    labInit.labSuperView(superView);
    return labInit;
}


+(instancetype)cnm_LabInitWithSuperView:(UIView*)superView withBlock:(void (^)(CNMLabel *lab))initBlock withlabWithMas_makeConstraints:(MasonryMake)masonryMake{
    
    CNMLabel* labInit =[self labInitWith:initBlock];
    labInit.labSuperView(superView);
    
    [labInit mas_makeConstraints:^(MASConstraintMaker *make) {
        CGSize size;
        if (labInit.sizeFree.height!= 0||labInit.sizeFree.width!= 0) {
            size = labInit.sizeFree;
            labInit.sizeFreeTemp = size;
        }else{
            size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
        }
        
        labInit.sizeFree = [labInit sizeConfirmToSize:size];
        //------小数点精确引起的误差
        labInit.sizeFree = CGSizeMake(labInit.sizeFree.width+0.5, labInit.sizeFree.height+0.5);
        masonryMake(make,labInit);
    }];
    
    
    return labInit;
}

//-(void)labWithMas_makeConstraints:(MasonryMake)masonryMake{
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        CGSize size;
//        if (self.sizeFree.height!= 0||self.sizeFree.width!= 0) {
//            size = self.sizeFree;
//        }else{
//            size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
//        }
//        self.sizeFree = [self sizeConfirmToSize:size];
//        //------小数点精确引起的误差
//        self.sizeFree = CGSizeMake(self.sizeFree.width+0.5, self.sizeFree.height+0.5);
//        masonryMake(make,self);
//    }];
//
//}
-(void)free{
    
}
-(void)setlabTextUpdate:(NSString *)labTextUpdate withSizeFreeTemp:(CGSize)sizeTemp{
    if (sizeTemp.height!= 0&&sizeTemp.width!= 0) {
        self.sizeFreeTemp = sizeTemp;
        
    }
    [self setlabTextUpdate:labTextUpdate ];
}


-(void)setlabTextUpdate:(NSString *)labTextUpdate{
    /*备注问题
     *sizeFreeTemp是否设置正确
     *约束其它地方引用，并间接被改变了
     */
    self.text = labTextUpdate;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        CGSize size;
        /*备注问题
         *更新位置的时候sizeFree是有的，这里默认高度为1行的时候重新计算sizeFree,
         *numberOfLines 如果设定值，需要提前设定好sizeFree的高度
         */
        if ((self.sizeFreeTemp.height!= 0&&self.sizeFreeTemp.width!= 0)&& self.numberOfLines!=1) {//多行lab手动设置过sizeFree
            
            size = self.sizeFreeTemp;
        }
        else if(self.sizeFreeTemp.height!= 0&&self.sizeFreeTemp.width!= 0&& self.numberOfLines == 1){//单行lab手动设置过sizeFree
            size = self.sizeFreeTemp;
            
        }else{//自适应
            size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
        }
        size = [self sizeConfirmToSize:size];
        //------小数点精确引起的误差
        self.sizeFree = CGSizeMake(size.width+0.5, size.height+0.5);
        make.size.mas_equalTo(self.sizeFree);
        
    }];
    
}

-(CNMLabel *)with{
    return self;
}


-(CNMLabel *(^)(UIView *))labSuperView{
    return ^CNMLabel *(UIView* view){
        [view addSubview:self];
        return self;
    };
}


-(CNMLabel *(^)(NSString *))labText{
    return ^CNMLabel *(NSString* text){
        self.text  = text;
        [self sizeToFit];
        return self;
    };
}

-(CNMLabel *(^)(CGFloat))labFont{
    return ^CNMLabel *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(CNMLabel *(^)(CGFloat))labBoldFont{
    return ^CNMLabel *(CGFloat fontSize){
        self.font = [UIFont boldSystemFontOfSize:fontSize];
        return self;
    };
}

-(CNMLabel *(^)(UIColor *))labTextColor{
    return ^CNMLabel *(UIColor* color){
        self.textColor = color;
        return self;
    };
}

-(CNMLabel *(^)(UIColor *))labBackgroundColor{
    return ^ CNMLabel *(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}

- (CNMLabel *(^)(NSTextAlignment))labTextAlignment{
    return ^CNMLabel *(NSInteger textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}
-(CNMLabel *(^)(NSInteger))labNumberLines{
    return ^CNMLabel *(NSInteger numberLines){
        self.numberOfLines = numberLines;
        return self;
    };
}

-(CNMLabel *(^)(NSString *, UIColor *, CGFloat))labCommon{
    return^ CNMLabel*(NSString* text,UIColor* color,CGFloat fontSize){
        self.text = text;
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(CNMLabel *(^)(CGSize))labSizeFree{
    return^ CNMLabel*(CGSize size){
        self.sizeFree =size;
        
        return self;
    };
}

-(CNMLabel *(^)(TextAlignmentVertical))labTextAlignmentVertical{
    return^ CNMLabel*(TextAlignmentVertical verticalAlignment ){
        self.textAlignmentvertical =verticalAlignment;
        return self;
    };
}

-(void)setTextAlignmentvertical:(TextAlignmentVertical)textAlignmentvertical{
    _textAlignmentvertical = textAlignmentvertical;
    [self setNeedsDisplay];
}

#pragma mark - **************** 垂直方向对齐
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_textAlignmentvertical) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}


-(NSMutableAttributedString*)attributedString{
    if (!_attributedString) {
        _attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    return _attributedString;
}


// 设置某段字的颜色,只能保留最后一次
- (void)setColor:(UIColor *)color fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
    
    [self.attributedString addAttribute:NSForegroundColorAttributeName
                                  value:color
                                  range:NSMakeRange(location, length)];
    
}

// 设置某段字的字体
- (void)setFont:(UIFont *)font fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
    
    [self.attributedString  addAttribute:(NSString *)kCTFontAttributeName
                                   value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)font.fontName,
                                                                                    font.pointSize*2,
                                                                                    NULL))
                                   range:NSMakeRange(location, length)];
}

// 设置某段字的风格
- (void)setStyle:(CTUnderlineStyle)style fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
    
    
    [self.attributedString  addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                                   value:(id)[NSNumber numberWithInt:style]
                                   range:NSMakeRange(location, length)];
}

-(void)setlabAttributedString{
    [self setAttributedText:self.attributedString];
    self.attributedString = nil;
}
-(CGSize)sizeConfirmToSize:(CGSize)size{
    return    ([self.text boundingRectWithSize:CGSizeMake(size.width, size.height)  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size);
}
-(void)cnm_getImageAttributedStringWithImageName:(NSString*)imageName withBounds:(CGRect)bounds  withInsertIndex:(NSInteger)index withEmptyStringLeftCount:(NSInteger)leftcount withEmptyStringRightCount:(NSInteger)rightCount{
    NSAttributedString *attrString = [self getImageAttributedStringWithImageName:imageName withBounds:bounds];
    [self.attributedString insertAttributedString:attrString atIndex:index];
    NSString* strEmpty = @"";
    BOOL isLeftNeedEmptyStr = false;
    if (leftcount>0) {
        for (NSInteger i = 0; i<leftcount; i++) {
            strEmpty = [strEmpty stringByAppendingString:@" "];
        }
        if (index==0) {
            NSLog(@"error ：越界");
            return;
        }
        isLeftNeedEmptyStr = YES;
    }else if(rightCount >0){
        for (NSInteger i = 0; i<rightCount; i++) {
            strEmpty = [strEmpty stringByAppendingString:@" "];
        }
        if (index!=0 && (self.text?self.text.length:0)==index) {
            NSLog(@"error ：越界");
            return;
        }
        isLeftNeedEmptyStr = NO;
    }
    if (strEmpty.length>0) {
        [self.attributedString insertAttributedString:[[NSMutableAttributedString alloc] initWithString:strEmpty]  atIndex:  isLeftNeedEmptyStr?index-1:index+1];
    }
    
}
-(NSAttributedString*)getImageAttributedStringWithImageName:(NSString*)imageName withBounds:(CGRect)bounds {
    NSTextAttachment *textAttachment= [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:imageName];  //设置图片源
    textAttachment.bounds = bounds;          //设置图片位置和大小
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment: textAttachment];
    return  attachmentString;
}
-(void)setlabEdgeInset:(UIEdgeInsets)rect{
    [self setNeedsDisplay];
    _edgeInsetsTmp = rect;
}
-(void)drawRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _edgeInsetsTmp)];
}
@end
