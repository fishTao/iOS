//
//  FriendViewController.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "FriendViewController.h"
#import "FriendGroup.h"
#import "FriendModel.h"
#import "FriendsTableViewCell.h"
#import "FriendHeadView.h"

@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)NSMutableArray *datas;
@property (nonatomic, strong) NSMutableArray *dict;
@property (nonatomic ,strong) FriendsTableViewCell *tableView;
@end

@implementation FriendViewController

-(NSMutableArray *)datas
{
    if (_datas == nil) {
        //获取plist文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        
        //将从plist中提取的文件放进数组array。
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array){
            FriendGroup *friendGroup = [FriendGroup friendGroupWithDictionary:dict];
            [models addObject:friendGroup];
        }
        _datas = models;
            }
    return _datas;
    }


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;


    
    //self.navigationItem.leftBarButtonItem =leftBarBtnItem;
    // Do any additional setup after loading the view.
}

- (IBAction)search:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"完成";
        [_tableView setEditing:YES animated:YES];
    }else{
        sender.title = @"编辑";
        [_tableView setEditing:NO animated:YES];
    }

}


#pragma mark -编辑（删除）

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //删除数据源
        [self.datas removeObjectAtIndex:indexPath.row];
        //删除单元格
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    rowAction.backgroundColor = [UIColor redColor];
    
    UITableViewRowAction *sharRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"分享" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
    }];
    sharRowAction.backgroundColor = [UIColor blueColor];
    
    return @[rowAction,sharRowAction];
}

#pragma mark -编辑（移动）
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    FriendModel *model = self.datas[sourceIndexPath.row];
    [self.datas removeObjectAtIndex:sourceIndexPath.row];
    [self.datas insertObject:model atIndex:destinationIndexPath.row];
}



#pragma mark    ===UITableViewDataSource===
//设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.datas.count;
}
//设置每组de行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    FriendGroup *datas = self.datas[section];
    if (datas.isopen) {
        return datas.friends.count;
    }

        return 0;
    }
//设置单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    FriendGroup *friendGroup = self.datas[indexPath.section];
    FriendModel *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    FriendGroup *friendGroup = self.datas[section];
    return friendGroup.name;
}


//section 设置头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

//设置section头视图内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //创建自定义的section的头视图
    FriendHeadView *headerView = [FriendHeadView sectionHeaderViewForTableView:tableView];
    FriendGroup *friendGroup = self.datas[section];
    headerView.friendGroup = friendGroup;
    
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
    };
    
    return headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
