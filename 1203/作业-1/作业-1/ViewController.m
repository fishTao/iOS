//
//  ViewController.m
//  作业-1
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYModel.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *tableView;
@property (nonatomic ,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identifier = @"cell";
-(NSArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        //读取数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //把字典转换成模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYModel *model = [QYModel modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
        }
    return  _datas;
}




- (void)viewDidLoad {
    [super viewDidLoad];

  
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --UITableViewDataSourec--
//设置共有多少组
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
//每组多少行及每行的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    QYModel *model = self.datas[indexPath.row];
    cell.model = model;
    tableView.rowHeight = 110;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
