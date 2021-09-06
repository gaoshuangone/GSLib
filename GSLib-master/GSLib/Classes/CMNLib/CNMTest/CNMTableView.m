//
//  CNMTableView.m
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMTableView.h"
#import "CNMTableViewCell.h"
@implementation CNMTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        
        _arrayCellIdentifiers = [NSMutableArray arrayWithCapacity:3];
        [_arrayCellIdentifiers addObject:@"CNMTableViewCell"];
        
    }
    return self;
}

-(void)cnm_registerClassWithTableView:(void (^)(CNMTableView* tableView))block{
    
    block(self);
    [self registerClass];//注册cell
    
}
-(Class)getClassWithIndex:(NSInteger)index{
    
    if (index <_arrayCellIdentifiers.count) {
        return NSClassFromString([_arrayCellIdentifiers objectAtIndex:index]);
    }
    return [CNMTableViewCell class];
}
-(void)registerClass{
    
    for (int i =0; i<self.arrayCellIdentifiers.count; i++) {
        
        Class object = NSClassFromString([self.arrayCellIdentifiers objectAtIndex:i]);
        
        [self registerClass:[object class] forCellReuseIdentifier:[object cellReuseIdentifier]];
    }
    
}

-(void)upDataWithModel:(id)model{
    
    
}
-(void)dealloc{
    if (_arrayCellIdentifiers) {
        [_arrayCellIdentifiers removeAllObjects];
    }
}

-(NSString*)getClassIdentifierWithIndex:(NSInteger)index{
    return [[self getClassWithIndex:index]cellReuseIdentifier];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
