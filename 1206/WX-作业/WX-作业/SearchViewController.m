//
//  SearchViewController.m
//  
//
//  Created by qingyun on 15/12/7.
//
//

#import "SearchViewController.h"
#import "FriendModel.h"
#import "TgTableViewCell.h"
@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSMutableArray *dataSounrce;
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation SearchViewController
 static NSString *identifier = @"buyIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_tableView];
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TgTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    [self.tableView registerClass:[TgTableViewCell class] forCellReuseIdentifier:identifier];
    self.tableView.rowHeight = 90;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    _dataSounrce = [NSMutableArray array];
    NSPredicate *predict = [NSPredicate predicateWithFormat:@"title CONTAINS[CD] %@",searchController.searchBar.text];
    _dataSounrce =(NSMutableArray *) [_datas filteredArrayUsingPredicate:predict];
    
    [self.tableView  reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSounrce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     TgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    FriendModel *model= self.dataSounrce[0];
    
  //  cell.model = model;
    return  cell;
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
