//
//  FriendHeadView.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "FriendHeadView.h"
#import "FriendGroup.h"
@interface FriendHeadView ()
@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *label;
@end


@implementation FriendHeadView

static NSString *headerViewIdentifier = @"headerView";
+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView{
    FriendHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headView == nil) {
        headView = [[FriendHeadView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headView;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加背景Btn
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //将背景btn添加到子视图上（self是一个View）
        [self addSubview:bgBtn];
        //设置背景
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *highlightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        //设置图标
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置标题字体颜色
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置内容的显示
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //设置整体的偏移量
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移量
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //设置bgBtn的图片视图的内容模式
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        //添加事件监听
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //添加label（在线人数/总人数）
        
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        
        label.textAlignment = NSTextAlignmentRight;
        
        _bgBtn = bgBtn;
        _label = label;
    

        
    }
    return self;
}

//设置
-(void)layoutSubviews{
    [super layoutSubviews];
    //设置bgBtn的frame
    _bgBtn.frame = self.bounds;
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
-(void)bgBtnClick:(UIButton *)btn{
    
    _friendGroup.isopen = !_friendGroup.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
}

-(void)setFriendGroup:(FriendGroup *)friendGroup{
    _friendGroup = friendGroup;
    
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld",friendGroup.online,friendGroup.friends.count];
    
    if (_friendGroup.isopen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
