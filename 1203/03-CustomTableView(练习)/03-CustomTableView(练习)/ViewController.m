//
//  ViewController.m
//  03-CustomTableView(练习)
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSArray *datas;
@end
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview: tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    _datas = @[@"111",@"222",@"333",@"444",@"555",@"666"];
    
    //设置单元格高度
    tableView.rowHeight = 100;
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark ---UITableViewDataSource---
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        //添加主标题
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.tag = 100;
        //添加副标题
        UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, titleLabel.frame.origin.y + titleLabel.frame.size.height, 200, 40)];
        [cell.contentView addSubview: subTitleLabel];
        subTitleLabel.tag = 101;
        
        //添加图标
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW - 80 -10, 10, 80, 80)];

        [cell.contentView addSubview:imageView];
        imageView.tag = 102;
  
    }
    //主标题
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:100];
    titleLabel.text = _datas[indexPath.row];

    //副标题
    UILabel *subTitleLabel = (UILabel *)[cell.contentView viewWithTag:101];
    subTitleLabel.text = @"这个人有点懒";
    //图标
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:102];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",indexPath.row]];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end






