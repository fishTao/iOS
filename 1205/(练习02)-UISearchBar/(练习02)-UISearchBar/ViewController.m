//
//  ViewController.m
//  (练习02)-UISearchBar
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSDictionary *dict;
@property (nonatomic ,strong) NSArray *keys;
@property (nonatomic) BOOL isSearching;
@end

@implementation ViewController
-(void)loadDatasFromFile{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sourtednames" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *allKeys = _dict.allKeys;
    _keys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDatasFromFile];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --UITableViewDataSource--

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = _keys[section];
    NSArray * array = _dict[key];
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (self == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSString *key = _keys[indexPath.section];
    NSArray *array = _dict[key];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}
//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (_isSearching) {
        return nil;
    }
    return _keys[section];
}

//索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if (_isSearching) {
        return nil;
    }
    return _keys;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
