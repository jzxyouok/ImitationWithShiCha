//
//  SettingTableViewCell.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/1.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

static float const IMAGE_WIDTH = 30;

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (UIImageView *)ppImageView
{
    if (!_ppImageView) {
        _ppImageView = [[UIImageView alloc] init];
        _ppImageView.backgroundColor = [UIColor redColor];
        _ppImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_ppImageView];
        
        [_ppImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(IMAGE_WIDTH, IMAGE_WIDTH));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(7);
        }];
        _ppImageView.layer.cornerRadius = 15;
    }
    return _ppImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        __typeof(self) __weak weakSelf = self;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-200, 44));
            make.left.equalTo(weakSelf.ppImageView.mas_right).offset(10);
            make.top.mas_equalTo(0);
        }];
    }
    return _titleLabel;
}

- (UILabel *)BenefitLabel
{
    if (!_BenefitLabel) {
        _BenefitLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_BenefitLabel];
        [_BenefitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 44));
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
    }
    return _BenefitLabel;
}


@end
