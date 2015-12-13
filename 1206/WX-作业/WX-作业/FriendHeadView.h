//
//  FriendHeadView.h
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import <UIKit/UIKit.h>
@class FriendGroup;
@interface FriendHeadView : UITableViewHeaderFooterView

@property (nonatomic, strong) FriendGroup *friendGroup;
@property (nonatomic, strong) void (^headerViewClick)(void);
+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;
@end
