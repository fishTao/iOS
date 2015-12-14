//
//  ViewController.m
//  （练习）KvoDemo
//
//  Created by qingyun on 15/12/14.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYPerson.h"
@interface ViewController ()
@property (nonatomic ,strong) QYPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _person = [[QYPerson alloc] init];
    //对person注册一个观察者
    [_person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)ChangAge:(UIButton *)sender {
    _person.age += 1;
    
}

//回调方法，观察值改变的时候，该方法 会调用。

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"age"]) {
        int oldAge = [change[@"old"]intValue];
        int newAge = [change[@"new"]intValue];
        NSLog(@"oldAge:%d,newAge:%d",oldAge,newAge);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
