//
//  QYCollectionViewCell.m
//  
//
//  Created by qingyun on 15/12/8.
//
//

#import "QYCollectionViewCell.h"
#import "QYApp.h"

@implementation QYCollectionViewCell

-(void)setApp:(QYApp *)app{
    _imageView.image = app.icon;
    _label.text = app.title;
}




- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *selectedBgView = [[UIView alloc] init];
    selectedBgView.backgroundColor = [UIColor blueColor];
    self.selectedBackgroundView = selectedBgView;

}

@end
