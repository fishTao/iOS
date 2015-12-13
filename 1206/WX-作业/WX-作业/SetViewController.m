//
//  SetViewController.m
//  
//
//  Created by qingyun on 15/12/6.
//
//

#import "SetViewController.h"
#import "ZoomScrollView.h"
@interface SetViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation SetViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addScrollView];
    
    [self addZoomScrollViewForScrollView];
    //将导航栏设置为不透明
    //self.navigationController.navigationBar.translucent = NO;
    
    
    // Do any additional setup after loading the view.
}


//添加滚动的scrollView
-(void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375 + 25, 603)];
 
     [self.view addSubview:scrollView];
    //设置contentSize
    scrollView.contentSize = CGSizeMake((375 + 25) * 3, 603);
    //设置代理
    scrollView.delegate = self;
    //设置分页
    scrollView.pagingEnabled = YES;
    //设置背景颜色
    scrollView.backgroundColor = [UIColor brownColor];
    
    _scrollView = scrollView;
  
}

//添加滚动的视图（用于缩放的scrollView）
-(void)addZoomScrollViewForScrollView
{
    for (int i = 0; i < 3; i++) {
        ZoomScrollView *zoomScrollView = [[ZoomScrollView alloc] initWithFrame:CGRectMake((375 + 25) * i, 0, 375, 603)];
        [_scrollView addSubview:zoomScrollView];
        
        
        //设置zoomScrollView的imageView的image
        NSString *imageName = [NSString stringWithFormat:@"%d_1.jpg",i + 1];
        zoomScrollView.img = [UIImage imageNamed:imageName];
    }
}


#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id object in scrollView.subviews) {
        //判断当前子视图是否为UIScrollView类型
        if ([object isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scroll = (UIScrollView *)object;
            scroll.zoomScale = 1.0;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
