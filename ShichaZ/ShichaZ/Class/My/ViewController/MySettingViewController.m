//
//  MySettingViewController.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "MySettingViewController.h"

@interface MySettingViewController ()
{
    UITableView *PPTabelView;
    
    NSArray *arrayData;
}
@end

@implementation MySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTopBar:@"我"];
    arrayData = [NSArray arrayWithObjects:@[@"登录/注册"],@[@"我的订单",@"我的钱包",@"我的评价"],@[@"系统消息",@"附近好友"],@[@"关于我们",@"提点建议",@"邀请好友"], nil];

    
    PPTabelView  = [[UITableView alloc] init];
    PPTabelView.delegate = self;
    PPTabelView.dataSource = self;
    PPTabelView.tableFooterView = [[UIView alloc] init];
    PPTabelView.scrollEnabled = NO;
    [self.view addSubview:PPTabelView];
    
    [PPTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, DEVICE_HEIGHT-BAR_HEIGHT-50));
        make.top.mas_equalTo(BAR_HEIGHT);
        make.left.mas_equalTo(0);
    }];
    
    if ([PPTabelView respondsToSelector:@selector(setSeparatorInset:)]) {
                [PPTabelView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([PPTabelView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [PPTabelView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[arrayData objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0) {
        [cell.ppImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-200, 64));
        }];
        
        [cell.BenefitLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 64));
        }];
        
        cell.ppImageView.layer.cornerRadius = 25;
    }
    else
    {
        [cell.ppImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-200, 44));
        }];
        
        [cell.BenefitLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 44));
        }];
        
        cell.ppImageView.layer.cornerRadius = 15;
    }
    
    cell.titleLabel.text = [[arrayData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 64.0f;
    }
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        LoginViewController *vc = [[LoginViewController alloc] init];
        vc.title = @"登录";
        [self.navigationController pushViewController:vc animated:YES];
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
