//
//  ViewController.m
//  06-CustomTableView(练习)
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identifier = @"cell";
-(NSArray *)datas
{
    if (_datas == nil) {
        //找到plist文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"];
        //读取数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //把数据中字典转为模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            Model *model = [Model modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark   ---UITableViewDataSource---

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    Model *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
