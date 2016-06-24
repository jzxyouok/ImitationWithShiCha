//
//  GroupViewController.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "GroupViewController.h"
#import "MJRefreshComponent.h"
#import "GroupTableViewCell.h"
#import "DiscussModel.h"
#import "DiscussRequestApi.h"
static NSString* const cellIdentifier = @"cell";
static float const HEADER_HEIGHT = 250;
static NSString* const imageURL = @"http://img.shichazu.com/201419/0/db15cdc6-1438-4270-9560-b95b76da25fd/original";

@interface GroupViewController ()<UITableViewDelegate,UITableViewDataSource,GroupTableViewCellDelegate,YTKRequestDelegate>
//{
//    DiscussRequestApi *api;
//}
@property (nonatomic,strong)DiscussResponseStatusModel *model;
@property (nonatomic,strong)UITableView *groupTable;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTopBar:@"圈"];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    if ([self.groupTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.groupTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.groupTable respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.groupTable setLayoutMargins:UIEdgeInsetsZero];
    }
    
    [self.groupTable.header beginRefreshing];
}

- (UITableView *)groupTable
{
    if (!_groupTable) {
        _groupTable = [[UITableView alloc] init];
        [self.view addSubview:_groupTable];
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        imageView.frame = CGRectMake(0, BAR_HEIGHT, DEVICE_WIDTH, HEADER_HEIGHT);
        imageView.backgroundColor = [UIColor blueColor];
        _groupTable.tableHeaderView = imageView;
        _groupTable.tableFooterView = [UIView new];
        _groupTable.delegate = self;
        _groupTable.dataSource = self;
        _groupTable.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        [_groupTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(BAR_HEIGHT);
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH, VIEW_HEIGHT-TABBAR_HEIGHT));
        }];
    }
    return _groupTable;
}

- (void)headerRefresh
{
    //加载网络数据
    
    [self loadData];
//    [_groupTable.header endRefreshing];
}


#pragma mark -
#pragma mark --uitableviewdelegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.result.results.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 140.0f;
    GroupTableViewCell *cell = (GroupTableViewCell *)[self tableView:self.groupTable cellForRowAtIndexPath:indexPath];
//    return [cell heightOfRow];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(CGRectGetMaxY(cell.timeLabel.frame)+10);
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.tag = indexPath.row+1000;
    cell.delegate = self;
    
    DiscussModel *disCuss = self.model.result.results[indexPath.row];
    [cell bingDataFrom:disCuss];
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

- (void)clickedHeadImageBy:(NSInteger)index
{
    NSLog(@"点了%ld的头像",(long)index);
}

- (void)clickedUserNameBy:(NSInteger)index
{
    NSLog(@"点了%ld的名字",(long)index);
}

- (void)loadData
{
    NSString *city = @"100";
    NSString *pageNo = @"2";
    NSString *sign = @"044af4e7e49579b6fa8ad261d8033a15";
    DiscussRequestApi *api = [[DiscussRequestApi alloc] initWithCity:city pageNo:pageNo sign:sign];
    api.delegate = self;
    [api start];
    
}
- (void)requestFinished:(YTKBaseRequest *)request
{
    NSLog(@"%@",request.responseString);
    [_groupTable.header endRefreshing];
    
    self.model = [[DiscussResponseStatusModel alloc] initWithString:request.responseString error:nil];
    
    [self performSelectorOnMainThread:@selector(refresh) withObject:nil waitUntilDone:YES];
    
    
}

- (void)refresh
{
    [_groupTable reloadData];
}

- (void)requestFailed:(YTKBaseRequest *)request
{
    NSLog(@"%@",request.responseString);
    

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
