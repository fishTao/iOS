//
//  ViewController.m
//  02-UITableView（练习）
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *datas;
@end
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@implementation ViewController

//懒加载，自定义数据
-(NSArray *)datas{
    if (_datas ==nil) {
        _datas = @[@"111",@"222",@"333",@"444"];
    }
    return _datas;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //创建TableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    //tableView.backgroundColor = [UIColor brownColor];
    
    //设置数据源(必须)
    tableView.dataSource = self;
    
    //设置代理
    tableView.delegate = self;
    //设置背景
    UIImageView  *bgView = [[UIImageView alloc]initWithFrame:tableView.frame];
    bgView.image = [UIImage imageNamed:@"bg.jpg"];
    tableView.backgroundView = bgView;
    
    //设置头视图
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, QYScreenW, 80)];
    headerLabel.text = @"徐璐";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.backgroundColor = [UIColor brownColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:26];
    tableView.tableHeaderView = headerLabel;
    
    
    //设置尾视图
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW,80)];
    footerLabel.text = @"TableViewFootView";
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.backgroundColor = [UIColor brownColor];
    footerLabel.font = [UIFont boldSystemFontOfSize:26];
    tableView.tableFooterView = footerLabel;
    
    
#pragma mark   -----设置section头尾宽高-----

    //设置sectionHeader的视图或者标题
    /*section
     1、高度的设置（属性，代理方法）
     2、设置头尾的标题
     3、设置头尾的视图
     注意：设置头尾视图的时候，如果当前的tableview的样式是UITableViewStyleGrouped，那么必须使用代理方法设置高度，如果tableview的样式是UITableViewStylePlain,属性和代理方法都可以设置高度
     */
    //头尾高度
    tableView.sectionHeaderHeight = 50;
    tableView.sectionFooterHeight = 50;
    //设置行高
    tableView.rowHeight = 50;
    //设置分割线、样式
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //设置颜色
    tableView.separatorColor = [UIColor blueColor];
    //设置缩进
    tableView.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30);
    
    //选中
    //tableView.allowsSelection = YES;
    tableView.allowsMultipleSelection = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark  -----UITableViewDataSource-----(设置tableView中的数据)


//设置tableView中的组数。
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//设置tableView每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
//设置每行的具体内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sss"];
#if 0
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld组，第%ld行",indexPath.section,indexPath.row];
#else
    cell.textLabel.text = self.datas[indexPath.row];
#endif
    return cell;
}
//设置section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
}
//设置section尾标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionFooterView:%ld",section];
}

#pragma mark -----UITableViewDelegate-----(代理来实现)
//设置section头视图

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionHeaderLabel = [[UILabel alloc] init];
    sectionHeaderLabel.text = [NSString stringWithFormat:@"徐璐%ld",section];
    sectionHeaderLabel.textAlignment = NSTextAlignmentCenter;
    
    return sectionHeaderLabel;
}

//设置section尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionFootterLabel = [[UILabel alloc] init];
    sectionFootterLabel.text = [NSString stringWithFormat:@"sectionfootView:%ld",section];
    sectionFootterLabel.textAlignment = NSTextAlignmentCenter;
    return sectionFootterLabel;
}
//设置section的头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
//设置section的尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        return 50;
    }
    return 60;//奇数行50 偶数行60
}
//允许高亮选中
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s, (%ld:%ld)",__func__, indexPath.section, indexPath.row);
    return YES;
}

//已经高亮显示
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
}
//已经取消高亮显示
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//将要选中
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
//将要取消选中
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
// Called after the user changes the selection.
//已经选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
    //获取点击的单元格
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}
//已经取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType =  UITableViewCellAccessoryDetailButton;
}

//设置辅助视图的样式
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDetailButton;
}

//点击辅助视图
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s , (%ld:%ld)", __func__, indexPath.section,indexPath.row);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




