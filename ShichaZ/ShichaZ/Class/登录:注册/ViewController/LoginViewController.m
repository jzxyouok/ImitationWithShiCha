//
//  LoginViewController.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong)IndentTextField *userNameText;
@property (nonatomic,strong)IndentTextField *pwdText;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTopBar:self.title];
    [self addBackButton];
    [self AddRightButton:@"注册"];
    
    [self setUI];
    
    [self.userNameText becomeFirstResponder];
}

- (void)setUI
{
    self.userNameText.placeholder = @"请输入手机号";
    self.pwdText.placeholder = @"请输入密码";
    
    __weak typeof (self) weakSelf = self;//防止block中循环引用
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    CGSize size = [PPUntils getSizeByString:@"忘记密码?" AndFontSize:12.0f WithBoundSize:CGSizeMake(MAXFLOAT, 30)];
    [forgetBtn setTitle:@"忘记密码?" forState:0];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:0];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.view addSubview:forgetBtn];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(size.width+10, 30));
        make.top.equalTo(self.pwdText.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.view).offset(-10);
    }];

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:loginBtn];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [loginBtn setTitle:@"登录" forState:0];
    [loginBtn setBackgroundColor:TOPBARCOLOR];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(LoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(DEVICE_WIDTH-20, 40));
        make.top.equalTo(forgetBtn.mas_bottom).offset(10);
        make.left.mas_offset(10);
    }];
    
    
}

- (UITextField *)userNameText
{
    if (!_userNameText) {
        _userNameText = [[IndentTextField alloc] init];
        _userNameText.keyboardType = UIKeyboardTypeNumberPad;
        _userNameText.font = [UIFont systemFontOfSize:14.0f];
        _userNameText.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_userNameText];
        
        [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(BAR_HEIGHT+10);
            make.size.mas_offset(CGSizeMake(DEVICE_WIDTH, 40));
        }];
        
    }
    return _userNameText;
}

- (UITextField *)pwdText
{
    if (!_pwdText) {
        _pwdText  = [[IndentTextField alloc] init];
        [self.view addSubview:_pwdText];
        _pwdText.backgroundColor = [UIColor whiteColor];
        _pwdText.font = [UIFont systemFontOfSize:14.0f];
        [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userNameText);
            make.top.equalTo(self.userNameText.mas_bottom).offset(1);
            make.size.mas_offset(CGSizeMake(DEVICE_WIDTH, 40));
        }];
    }
    return _pwdText;
}

- (void)LoginBtnClick:(UIButton *)sender
{
    NSLog(@"登录");
}

- (void)clickRightButton:(UIButton *)sender
{
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    vc.title = @"注册";
    [self.navigationController pushViewController:vc animated:YES];
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
