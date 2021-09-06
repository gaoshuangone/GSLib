//
//  CNMTableViewCell.m
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMTableViewCell.h"

@implementation CNMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)cellGetBlock:(CellGetBlock)cellGetBlock{
    _cellSendBlock = cellGetBlock;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    
}
+ (NSString *)cellReuseIdentifier{
    return NSStringFromClass([self class]);
}

- (UITableView *)__getTableView
{
    static int level = 10;
    UITableView *tableView = nil;
    
    UIView *view = self.superview;
    for (int i = 0; i < level; i++) {
        if ([view isKindOfClass:[UITableView class]]) {
            tableView = (UITableView *)view;
            break;
        }
        if (view.superview) {
            view = view.superview;
        }
        else {
            break;
        }
    }
    
    return tableView;
}
- (NSIndexPath *)indexPath
{
    if (_indexPath) {
        return _indexPath;
    }
    
    _indexPath = [[self __getTableView] indexPathForCell:self];
    return _indexPath;
}
+(CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)dealloc{
    if (_cellGetBlock) {
        _cellGetBlock = nil;
    }
    if (_cellSendBlock) {
        _cellSendBlock = nil;
    }
}
@end
