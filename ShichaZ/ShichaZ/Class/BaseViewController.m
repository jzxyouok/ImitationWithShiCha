//
//  BaseViewController.m
//  ShichaZ
//
//  Created by Kity on 16/5/20.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUDCOLOR;
    [self initTopBar:self.title];
    
    if( (SYSTEMVERSION >= 7.0))
    {
        viewState = [[UIView alloc] init];
        viewState.backgroundColor = TOPBARCOLOR;
        [self.view addSubview:viewState];
        [viewState mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, 20));
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
    }
    
}

//重写navigationBar
- (void)initTopBar:(NSString *)str
{
    self.navigationController.navigationBarHidden=YES;
    self.topBarView = [[UIView alloc] init ];
    [self.view addSubview:self.topBarView];
    [self.topBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, BAR_HEIGHT));
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
    }];
    
    //给topbar添加一张背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"navibar.png"];
    [self.topBarView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, BAR_HEIGHT));
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
    }];
    
    lblTitle = [[UILabel alloc] init ];
    lblTitle.font = [UIFont systemFontOfSize:16];
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.text = str;
    [self.topBarView addSubview:lblTitle];
    [lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 44));
        make.top.mas_equalTo(TopDistin(0));
        make.left.mas_equalTo(DEVICE_WIDTH/2-100);
    }];
    
    if (str.length < 1) {
        lblTitle.text = self.title;
    }
}

//创建返回按钮
- (void)addBackButton
{
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];  // 创建按钮
    [backBtn setFrame:CGRectMake(0, TopDistin(0), 50, 44)];   // 设置大小
    [backBtn setImage:[UIImage imageNamed:@"btnback.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchDown];
    backBtn.tag=11880;
    [backBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.topBarView addSubview:backBtn];
}

/**
 *  创建右侧按钮
 *
 *  @param str 按钮标题
 */
- (void)AddRightButton:(NSString *)str
{
    saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];  // 创建按钮
    [saveBtn setFrame:CGRectMake(self.view.frame.size.width-50,TopDistin(0), 50, 44)];   // 设置大小
    saveBtn.titleLabel.font = [UIFont systemFontOfSize: 15];
    [saveBtn setTitle:str forState:UIControlStateNormal];
    [saveBtn setTitle:str forState:UIControlStateHighlighted];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [saveBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.topBarView addSubview:saveBtn];
    
}

/**
 *  创建右侧按钮
 *
 *  @param img 按钮图片
 */
- (void)AddRightButtonWithImage:(UIImage *)img
{
    saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];  // 创建按钮
    [saveBtn setFrame:CGRectMake(self.view.frame.size.width-50,TopDistin(0), 50, 44)];   // 设置大小
    saveBtn.titleLabel.font = [UIFont systemFontOfSize: 15];
    [saveBtn setImage:img forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [saveBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.topBarView addSubview:saveBtn];
    
}

#pragma mark -
#pragma mark --按钮点击事件--
- (void)clickRightButton:(UIButton *)sender
{

}

- (void)clickBackButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
