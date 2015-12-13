//
//  ViewController.m
//  (练习04)-UIWebViewDemo
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载请求
    [self loadTextFieldRequest];
    //允许缩放
    _webView.scalesPageToFit = YES;
    // Do any additional setup after loading the view, typically from a nib.
}
//加载请求
-(void)loadTextFieldRequest{
    //加载网络请求
    NSURL *url = [NSURL URLWithString:_textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
#pragma mark --UIWebViewDelegate--
//已经开始加载网址
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
//加载成功
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
//加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *string = @"<html><marquee><h1>对不起，你访问的网址不存在</h1></marquee></html>";
    //加载html
    [webView loadHTMLString:string baseURL:nil];
}

#pragma mark - UITextFieldDelegate
//在键盘上编辑加载网址
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    [self loadTextFieldRequest];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
