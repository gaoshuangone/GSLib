//
//  CNMBaseViewController.h
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _BaseViewType
{
    ViewType_Default,  //默认vc的view
    ViewType_ScroolViewType,//scroolView
    ViewType_TableViewType_Plan,//UITableViewStylePlan
    ViewType_TableViewType_Group,//UITableViewStyleGroupe
    
}BaseViewType;

@interface CNMBaseViewController : UIViewController
/**默认类型是BaseViewType，是没有scrollview，此时scrollview为空
 使用的话，[super viewDidLoad]之前需要指定类型
 */
@property (nonatomic,assign) BaseViewType baseViewType;


@end
