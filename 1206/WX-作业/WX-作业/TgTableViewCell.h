//
//  TgTableViewCell.h
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import <UIKit/UIKit.h>
@class Tgmodel;
@interface TgTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;


@property (nonatomic ,strong) Tgmodel *model;
@end
