//
//  CNMAgentViewController.m
//  Example
//
//  Created by 高爽 on 2017/11/2.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CNMAgentViewController.h"

@interface CNMAgentViewController ()
@property (copy, nonatomic)HeightForRowBlock heightForRowBlock;
@property (copy, nonatomic)HeightForHeaderBlock heightForheaderBlock;
@property (copy, nonatomic)HeightForFooterBlock heightForFooterBlock;
/** 返回行数*/
@property (copy, nonatomic)NumberRowsInSectionBlock rowsBlock;
/** 返回分区数*/
@property (copy, nonatomic)NumberSectionsBlock sectionsBlock;
/** (可选)返回定制的cell*/
@property (copy, nonatomic)CellBlcok cellBlock;

@property (copy, nonatomic)CellTouchBlock cellGetBlock;
/** 返回cell传值到vc的block*/
//@property (copy, nonatomic)CellTouch cellTouch;
/** 返回VC传值到cell的block*/
@property (copy, nonatomic)CellTouchBlock cellTouchBlock;
@property (assign, nonatomic)BOOL isAutoTableView;//是否适用blcok
/** 返回当前indexPath的cellType*/
@property (copy, nonatomic)CellTypeBlock cellTypeBlock;


@end

@implementation CNMAgentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseViewControllerUI];
    // Do any additional setup after loading the view.
}
-(void)initBaseViewControllerUI{
    CGRect rect = self.view.frame;
    rect.origin.y += 20;
    rect.size.height -= 20;
    self.view.frame = rect;
    if (self.baseViewType == ViewType_ScroolViewType)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }else if (self.baseViewType != ViewType_Default){
        
        UITableViewStyle style  = self.baseViewType==ViewType_TableViewType_Plan?UITableViewStylePlain:UITableViewStyleGrouped;
        _tableView = [[CNMTableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-44) style:style];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(CNMTableView *)tableView{

    
    __block NSInteger sectionsCount = 1;
    self.sectionsBlock=^(NSInteger setions){
        sectionsCount = setions;
    };
    self.sections(tableView,self.sectionsBlock);
    return sectionsCount;
}

-(NSInteger)tableView:(CNMTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    __block NSInteger rowsCount =1;
    self.rowsBlock = ^(NSInteger rows){
        rowsCount = rows;
    };
    self.rows(tableView,section,self.rowsBlock);
    return rowsCount;
}
-(UITableViewCell*)tableView:(CNMTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    __block CNMTableViewCell* cell = nil;//定义一个基类CNMTableViewCell
    __block Class clasTemp = nil;//定义个临时CNMTableViewCell类型class
    self.cellTypeBlock = ^( Class class) {//从vc的block中取到当前indexPath对应的class
        clasTemp = class;
        
    };
    self.cellType(indexPath, self.cellTypeBlock);//触发block返回indexPath对应的class
    
   
    cell = [tableView dequeueReusableCellWithIdentifier:(clasTemp && [tableView.arrayCellIdentifiers containsObject:NSStringFromClass(clasTemp)])?NSStringFromClass(clasTemp):@"CNMTableViewCell" ];//如果指定了CNMTableViewCell类型并且tableView已经注册成功了该类型的cell，去重用这个cell，否则默认返回YMTableViewCell,并清理subviews
    
    if ([cell.reuseIdentifier isEqualToString:@"CNMTableViewCell"]) {//如果是默认的CNMTableViewCell
        for (UIView* view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
//        cell.backgroundColor = kColorWithRandom;
        cell.textLabel.text = [NSString stringWithFormat:@"section = %ld--row = %ld",indexPath.section,indexPath.row];
    }
    [cell updateWithCellData:nil atIndexPath:indexPath];

    
    if (self.cellBlock) {
        self.cellBlock = nil;
    }
    self.cellBlock =^(CNMTableViewCell* cellNew){//从vc的block中取到当前重新定制过后的CNMTableViewCell的类型
        cell = cellNew;
    };
    
    self.cell(tableView,cell,indexPath,self.cellBlock);//触发block返回当前的class，处理逻辑
    
    
    if (cell.cellSendBlock) {//cell上点击传递给vc的tag，data
        cell.cellSendBlock = nil;
    }
    
    
    __weak __typeof(self) weakSelf = self;
    cell.cellSendBlock = ^(NSInteger tag , id data){
        [weakSelf getBlockType:@"touchBlock" withBlock:weakSelf.cellTouchBlock withRow:indexPath.row withSection:indexPath.section withTableView:tableView withTag:tag withData:data];
    };
    return cell;
}
#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(CNMTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    __block NSInteger height =0;
    
    
    if (self.cellTypeBlock) {
        self.cellTypeBlock = nil;
    }
    __block Class clasTemp = nil;
   self.cellTypeBlock = ^( Class clas) {
       clasTemp = clas;
      
   };
    
    self.self.cellType(indexPath, self.cellTypeBlock);
    
    if (!_isAutoTableView) {
        return height;
    }
    height =  [(clasTemp?clasTemp:[CNMTableViewCell class]) heightForCellData:nil atIndexPath:indexPath] ;

    if (self.heightForRowBlock) {
        
        self.heightForRowBlock = nil;
    }
    
    self.heightForRowBlock = ^(CGFloat cellHeight){
        height = cellHeight;
    };
    [self getBlockType:@"cellHeight" withBlock:self.heightForRowBlock withRow:indexPath.row withSection:indexPath.section withTableView:tableView withTag:0 withData:nil];
    return height;
}
-(CGFloat)tableView:(CNMTableView *)tableView heightForHeaderInSection:(NSInteger)section{
    

    __block NSInteger height =0;
    if (!_isAutoTableView) {
        return height;
    }
    
    if (self.heightForheaderBlock) {
        self.heightForheaderBlock = nil;
    }
    self.heightForheaderBlock = ^(CGFloat cellHeight){
        height = cellHeight;
    };
    
    
    [self getBlockType:@"headerHeight" withBlock:self.heightForheaderBlock withRow:0 withSection:section withTableView:tableView withTag:0 withData:nil];
    return height;
}

-(CGFloat)tableView:(CNMTableView *)tableView heightForFooterInSection:(NSInteger)section{
    

    __block NSInteger height =0;
    if (!_isAutoTableView) {
        return height;
    }
    
    if (self.heightForFooterBlock) {
        self.heightForFooterBlock = nil;
    }
    self.heightForFooterBlock = ^(CGFloat cellHeight){
        height = cellHeight;
    };
    [self getBlockType:@"footerHeight" withBlock:self.heightForFooterBlock withRow:0 withSection:section withTableView:tableView withTag:0 withData:nil];
    return height;
}


-(void)getBlockType:(NSString*)strMark withBlock:(id)block withRow:(NSInteger)row withSection:(NSInteger)section withTableView:(CNMTableView*)tableView withTag:(NSInteger)tag withData:(id)data{
    
    if (!_isAutoTableView) {
        return ;
    }
    
    self.cellTouchBlock = nil;
    self.heightForheaderBlock = nil;
    self.heightForRowBlock = nil;
    self.heightForFooterBlock = nil;
    NSInteger tagTarget = 0;
    id dataTarget = nil;
    NSInteger rowTarget = 0;
    NSInteger sectionTarget = 0;
    CNMTableView* tableViewTarget = nil;
    
    if ([strMark isEqualToString:@"touchBlock"]) {
        self.cellTouchBlock = block;
        tagTarget = tag;
        dataTarget = data;
        
    }else if([strMark isEqualToString:@"cellHeight"]){
        self.heightForRowBlock = block;
        sectionTarget = sectionTarget;
        rowTarget = row;
        tableViewTarget = tableView;
        
    }else if([strMark isEqualToString:@"headerHeight"]) {
        self.heightForheaderBlock = block;
        sectionTarget = sectionTarget;
        tableViewTarget = tableView;
    }else if ([strMark isEqualToString:@"footerHeight"]){
        self.heightForFooterBlock = block;
        sectionTarget = sectionTarget;
        tableViewTarget = tableView;
        
    }
    //会触发同一个block，vc中判断是执行哪个，判断block有实现就可以
    self.otherItems(self.heightForRowBlock,self.heightForheaderBlock,self.heightForFooterBlock,rowTarget,sectionTarget,tableViewTarget,self.cellTouchBlock,tag,data);
}


-(void)cnm_tableViewDelegateWithSections:(Sections)sections withRows:(Rows)rows withTableViewCell:(Cell)cell withOtherItems:(OtherItems)otherItems with:(CellType)celltype{
    _isAutoTableView = YES;
    if (sections) {
        self.sections = sections;
    }
    
    if (rows) {
        self.rows = rows;
    }
    if (cell){
        self.cell = cell;
        
    }
    if (otherItems) {
        self.otherItems = otherItems;
    }
    if (celltype) {
       self.cellType = celltype;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    if (_tableView) {

        [_tableView removeFromSuperview];
        _tableView = nil;
    }
    if (_scrollView) {
        [_scrollView removeFromSuperview];
        _scrollView = nil;
    }
    
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
