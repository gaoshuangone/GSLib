//
//  CNMTableView.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNMTableView : UITableView
/** 注册的cell数组*/
@property (strong, nonatomic)NSMutableArray* arrayCellIdentifiers;

/** block返回tableview实例，初始化没有完成的操作
 */
-(void)cnm_registerClassWithTableView:(void (^)(CNMTableView* tableView))block;

@end
