//
//  BaseViewController.h
//  ShichaZ
//
//  Created by Kity on 16/5/20.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    UILabel *lblTitle;
    UIView *viewState;
    UIButton *saveBtn;
    UIButton * backBtn;
}
@property(nonatomic, strong)UIView *topBarView;

- (void)initTopBar:(NSString *)str;
- (void)addBackButton;
- (void)AddRightButton:(NSString *)str;
- (void)AddRightButtonWithImage:(UIImage *)img;
- (void)clickRightButton:(UIButton *)sender;
- (void)clickBackButton:(UIButton *)sender;

@end
