//
//  QYTableViewCell.m
//  
//
//  Created by qingyun on 15/12/3.
//
//

#import "QYTableViewCell.h"

@implementation QYTableViewCell
#define QYScreenW [UIScreen mainScreen].bounds.size.width


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UISwitch *sw = [[UISwitch alloc] init];
        [self.contentView addSubview:sw];
        _sw = sw;
    }
    return self;
}


//布局子视图
-(void)layoutIfNeeded{
    
    //更改标题label的frame
    self.textLabel.frame = CGRectMake(10, 10, 200, 40);
    //更改副标题detailLabel的frame
    self.detailTextLabel.frame = CGRectMake(80, self.textLabel.frame.origin.y + self.textLabel.frame.size.height, 200, 40);
    //更改图标
    self.imageView.frame = CGRectMake(QYScreenW - 80 - 10, 10, 80, 80);
    
    //设置UISwitch的frame
    _sw.frame = CGRectMake(220, 10, 50, 50);

    
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
