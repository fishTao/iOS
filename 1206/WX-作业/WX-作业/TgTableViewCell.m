//
//  TgTableViewCell.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "TgTableViewCell.h"
#import "Tgmodel.h"
@implementation TgTableViewCell
-(void)setModel:(Tgmodel *)model
{
  
    _model = model;
    _nameLabel.text = model.title;
    _moneyLabel.text = model.price;
    _numLabel.text = model.buycount;
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
