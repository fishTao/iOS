//
//  QYCollectionViewCell.h
//  
//
//  Created by qingyun on 15/12/8.
//
//

#import <UIKit/UIKit.h>
@class QYApp;
@interface QYCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) QYApp *app;
@end
