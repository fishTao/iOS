//
//  ViewController.m
//  (练习01)-刷新和加载更多
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //创建TAbleView。
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate =self;
    //注册单元格
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    tableView.rowHeight = 100;
    _datas = [NSMutableArray arrayWithObjects:@"111",@"222",@"333",@"444",@"555",@"666", nil];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [tableView addSubview:refreshControl];
    //调用刷新的方法
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];

    
    //添加尾试图
    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    footerBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    [footerBtn setTitle:@"稍等一会..." forState:UIControlStateNormal];
    footerBtn.backgroundColor = [UIColor grayColor];
    [footerBtn addTarget:self action:@selector(loadMoreSouce) forControlEvents:UIControlEventTouchUpInside];
     //将尾视图添加至tableView
    //tableView.tableFooterView = footerBtn;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//添加新的表格
-(void)loadMoreSouce{
    [_datas addObject:@"新建表格..."];
    [_tableView reloadData];
}

//设置刷新
-(void)refresh:(UIRefreshControl *)refreshControl{
    [refreshControl performSelector:@selector(endRefreshing) withObject:nil afterDelay:1];
}

#pragma mark --UITableViewDataSousce--
//设置组数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}
//每组的行数及内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}
#pragma mark - UIScrollViewDelegate
//设置上拉一定距离后加载更多
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_tableView.contentOffset.y > (_tableView.contentSize.height - _tableView.frame.size.height) + 100) {
        [self loadMoreSouce];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
