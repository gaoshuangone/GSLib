//
//  CNMTableViewCell.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNMTableViewCell : UITableViewCell
typedef void (^CellGetBlock)(NSInteger tag, id data);
//typedef void (^CellTouch)(NSInteger Tag,id data,CellTouchBlock cellTouchBlock);
/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (copy, nonatomic)CellGetBlock cellGetBlock;
@property (copy, nonatomic)CellGetBlock cellSendBlock;

-(void)cellGetBlock:(CellGetBlock)cellGetBlock;
- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;
/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/** */
+ (CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;
@end
