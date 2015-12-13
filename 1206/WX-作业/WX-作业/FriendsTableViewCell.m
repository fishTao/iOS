//
//  FriendsTableViewCell.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "FriendsTableViewCell.h"
#import "FriendModel.h"
@implementation FriendsTableViewCell
-(void)setFriend:(FriendModel *)friend{
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.status;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
 
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
