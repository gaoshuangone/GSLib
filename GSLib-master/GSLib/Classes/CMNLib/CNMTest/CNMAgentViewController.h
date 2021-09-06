//
//  CNMAgentViewController.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMBaseViewController.h"
#import "CNMTableViewCell.h"
#import "CNMTableView.h"
@interface CNMAgentViewController : CNMBaseViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
/**如果基于scrollview的话，将内容加到scrollview，不需要手动创建*/
@property (nonatomic,strong) UIScrollView *scrollView;
/**如果子视图包含tableview的话，默认tableview的大小和view的大小一样，可以自己设置大小*/
@property (nonatomic,strong) CNMTableView *tableView;




typedef void (^NumberRowsInSectionBlock)(NSInteger rows);
typedef void (^NumberSectionsBlock)(NSInteger sections);
typedef void (^CellBlcok)(CNMTableViewCell* cell);
typedef void (^CellTouchBlock)(NSInteger tag, id data);
typedef void (^HeightForRowBlock)(CGFloat height);
typedef void (^HeightForHeaderBlock)(CGFloat height);
typedef void (^HeightForFooterBlock)(CGFloat heitht);
typedef void (^CellTypeBlock)(Class clas);

typedef void (^Sections)(CNMTableView* tableView,NumberSectionsBlock sectionsBlock);
typedef void (^Rows)(CNMTableView* tableView,NSInteger section,NumberRowsInSectionBlock rowsBlock);
typedef void (^CellTouch)(NSInteger Tag,id data,CellTouchBlock cellTouchBlock);
typedef void (^Cell)(CNMTableView* tableView,CNMTableViewCell* cell,NSIndexPath* indexPath,CellBlcok cellBlock);
typedef void (^CellType)(NSIndexPath* indexPath,CellTypeBlock cellType);

/** heightForRowBlock  行高
 heightForheaderBlock  header高度
 heightForFooterBlock  footer高度
 row    所在行
 section    所在分区
 tableView    当前所属tableView
 cellTouchBlock 接受cell传值的block
 tag    cell传值tag
 data   cell传值data
 */
typedef void (^OtherItems)(HeightForRowBlock heightForRowBlock,HeightForHeaderBlock heightForheaderBlock,HeightForFooterBlock heightForFooterBlock,NSInteger row,NSInteger section,CNMTableView* tableView,CellTouchBlock cellTouchBlock, NSInteger tag, id data);

/** 返回rows的代理方法参数 并返回一个block*/
@property (copy, nonatomic)Rows rows;
/** 返回sections的代理方法参数 并返回一个block*/
@property (copy, nonatomic)Sections sections;
/** 返回cell的代理方法参数 并(可选)返回一个cell*/
@property (copy, nonatomic)Cell cell;
@property (copy, nonatomic)OtherItems otherItems;
/** 返回当前indexPath的cellType*/
@property (copy, nonatomic)CellType cellType;

/** sections 返回sections代理的参数并提交一个行数
 rows  返回row代理的参数并提交一个行数
 cell  返回cell代理参数，可选重新定义一个cell
 otherItems 返回行高，header，footer高度，以及cell的回调
 CellType   返回当前indexPath的cellType
 */
-(void)cnm_tableViewDelegateWithSections:(Sections)sections withRows:(Rows)rows withTableViewCell:(Cell)cell withOtherItems:(OtherItems)otherItems with:(CellType)celltype;


@end
