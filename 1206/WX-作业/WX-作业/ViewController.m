//
//  ViewController.m
//  WX-作业
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Tgmodel.h"
#import "TgTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@property (nonatomic ,strong) NSArray *datas;
@property (nonatomic, strong) NSMutableDictionary *dict;
@end

@implementation ViewController
static NSString *identifier = @"cell";

//懒加载，添加数据
-(NSArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        //读取数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //把字典转换成模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            Tgmodel *model = [Tgmodel modelWithDictionary:dict];
            [models addObject:model];
        }
        _datas = models;
    }
    return  _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    [self addContentForScrollView];

    
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.leftBarButtonItem =leftBarBtnItem;
//    UIBarButtonItem *sharBarBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector()];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)editAction:(UIBarButtonItem *)item{
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"完成";
        [_tableView setEditing:YES animated:YES];
    }else{
        item.title = @"编辑";
        [_tableView setEditing:NO animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出数据
    NSMutableArray *array = [NSMutableArray arrayWithArray:_datas];
    
    if (editingStyle ==  UITableViewCellEditingStyleDelete) {
        //更改数据源
        [array removeObjectAtIndex:indexPath.row];
        _datas = array;
        //更改界面
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }

}

#pragma mark --UITableViewDataSourec--
//设置共有多少组
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
//每组多少行及每行的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    Tgmodel *model= self.datas[indexPath.row];
    cell.model = model;

    return cell;
}
//
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//-(void)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark    ======添加SclollView=======


//添加用于滚动的scrollView
-(void)addScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 140)];
    [self.view addSubview:scrollView];
    
    //设置contentsize
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3, 140);
    //分页
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
    
    //设置背景
    scrollView.backgroundColor = [UIColor brownColor];
    
    _ScrollView = scrollView;
}

//添加scrollView的内容
-(void)addContentForScrollView
{
    for (int i = 0; i < 3; i++) {
        UIScrollView *zoomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(375 * i, 0, 375, 140)];
        [_ScrollView addSubview:zoomScrollView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 140)];
        [zoomScrollView addSubview:imageView];
        //设置scroll的图片
        NSString *imageName = [NSString stringWithFormat:@"%d_1.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
//        //设置代理
        zoomScrollView.delegate = self;
//        //设置缩放的比例范围
        zoomScrollView.maximumZoomScale = 2;
        zoomScrollView.minimumZoomScale = 0.5;
        
        //设置imageView的tag
        imageView.tag = 100;
        
        //添加双击方法
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doClick:)];
        //有效点击次数
        tap.numberOfTapsRequired = 2;
        [zoomScrollView addGestureRecognizer:tap];
    }
}
//设置双击缩放方法
-(void)doClick:(UITapGestureRecognizer *)tap{
    //获取缩放的scrollView
    UIScrollView *zoomScrollView = (UIScrollView *)tap.view;
    //判断当前zoomScrollView的缩放比例，如果不等于1，还原为1
    
    if (zoomScrollView.zoomScale != 1.0) {
        zoomScrollView.zoomScale = 1.0;
        return;
    }
    
    //zoomScrollView的缩放比例等于1
    CGPoint tapPoint = [tap locationInView:zoomScrollView];
    
    //创建一放大的矩形（宽:20,高:20）
    CGRect rect = CGRectMake(tapPoint.x , tapPoint.y , 20, 20);
    
    [zoomScrollView zoomToRect:rect animated:YES];
    
}

#pragma mark - UIScrollViewDelegate（缩放）
//点击后缩放这三个视图。
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == _ScrollView) return nil;
    
    UIImageView *imgView = (UIImageView *)[scrollView viewWithTag:100];
    
    return imgView;
}

//翻页后将所有的视图大小还原
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _ScrollView) {
        for (id sc in scrollView.subviews) {
            //判断当前的sc是否为原始大小
            if ([sc isKindOfClass:[UIScrollView class]]) {
                UIScrollView *scroll = (UIScrollView *)sc;
                scroll.zoomScale = 1.0;
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
