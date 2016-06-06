//
//  CustomTabbarController.m
//  ShichaZ
//
//  Created by Kity on 16/5/20.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "CustomTabbarController.h"

@interface CustomTabbarController ()

@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController *FoodNav = [[ UINavigationController alloc] initWithRootViewController:[[RestaurantGroupViewController alloc] init]];
    [self setupChildController:FoodNav imageName:@"" selectedImage:@""];
    
    UINavigationController *GroupNav = [[UINavigationController alloc] initWithRootViewController:[[GroupViewController alloc] init]];
    [self setupChildController:GroupNav imageName:@"" selectedImage:@""];

    MySettingViewController *settingVC = [[MySettingViewController alloc] init];
    UINavigationController *SettingNav = [[UINavigationController alloc] initWithRootViewController:settingVC];
    [self setupChildController:SettingNav imageName:@"" selectedImage:@""];

    
    // 设置tabbar的背景图
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
}

- (void)setupChildController:(UIViewController *)vc imageName:(NSString *)imgName selectedImage:(NSString *)selectedImgName {
    // 设置图片间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    // 设置图片的不渲染
    UIImage *image = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    [self addChildViewController:vc];
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
