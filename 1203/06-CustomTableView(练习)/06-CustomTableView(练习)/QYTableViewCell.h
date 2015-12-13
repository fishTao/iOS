//
//  QYTableViewCell.h
//  
//
//  Created by qingyun on 15/12/3.
//
//

#import <UIKit/UIKit.h>
@class Model;
@interface QYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISwitch *sw;

@property (nonatomic ,strong) Model *model;
@end
