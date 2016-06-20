//
//  GroupViewController.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "GroupViewController.h"
#import "MJRefreshComponent.h"
static NSString* const cellIdentifier = @"cell";

@interface GroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *groupTable;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:@"圈"];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
//    self.groupTable//加到ViewDidLoad
if ([self.groupTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.groupTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.groupTable respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.groupTable setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableView *)groupTable
{
    if (!_groupTable) {
        _groupTable = [[UITableView alloc] init];
        [self.view addSubview:_groupTable];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, BAR_HEIGHT, DEVICE_WIDTH, 100);
        imageView.backgroundColor = [UIColor blueColor];
        _groupTable.tableHeaderView = imageView;
        _groupTable.tableFooterView = [UIView new];
        _groupTable.delegate = self;
        _groupTable.dataSource = self;
        _groupTable.header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        [_groupTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(BAR_HEIGHT);
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, VIEW_HEIGHT-TABBAR_HEIGHT));
        }];
    }
    return _groupTable;
}

- (void)headerRefresh
{
//    [_groupTable.header beginRefreshing];
    NSLog(@"1231");
    
    [_groupTable.header endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
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
