//
//  CNMBaseViewController.m
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMBaseViewController.h"

@interface CNMBaseViewController ()

@end

@implementation CNMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /*如果view里包含scrollview，不设置此属性，会显示位置不正确。*/
    self.automaticallyAdjustsScrollViewInsets = NO;
    /*view里子视图如果不偏移64像素，会被覆盖*/
    self.edgesForExtendedLayout = UIRectEdgeNone;
    /*视图控制器，四条边不指定*/
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
