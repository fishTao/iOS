//
//  QYTableViewCell.m
//  
//
//  Created by qingyun on 15/12/3.
//
//

#import "QYTableViewCell.h"
#import "Model.h"
@implementation QYTableViewCell
-(void)setModel:(Model *)model
{   //
    _model = model;
    
    
    _titleLabel.text = model.name;
    _detailTitleLabel.text = model.sex;
    _sw.on = model.ison;
    _imgView.image = [UIImage imageNamed:model.icon];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
