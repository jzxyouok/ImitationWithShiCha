//
//  GroupTableViewCell.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/15.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

static float const HEADIMAGE_WIDTH = 30;
static float const LABLE_WIDTH = 100;
static float const LABLE_HEIGHT = 20;

#import "GroupTableViewCell.h"

@interface GroupTableViewCell ()

@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic,strong)UILabel *userNameLabel;
@property (nonatomic,strong)UILabel *rebateLabel;//折扣
@property (nonatomic,strong)UILabel *couptonLabel;//就餐时间
@property (nonatomic,strong)UILabel *distanceLabel;//距离
@property (nonatomic,strong)UILabel *contentLabel;//评价
@property (nonatomic,strong)UILabel *timeLabel;//评价时间
@property (nonatomic,strong)NSArray *imageArray;//图片数组


@end

@implementation GroupTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSArray array];
    }
    return _imageArray;
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.backgroundColor = [UIColor redColor];
        _headImage.layer.cornerRadius = HEADIMAGE_WIDTH/2;
        _headImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_headImage];
        _headImage.userInteractionEnabled = YES;
        [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(HEADIMAGE_WIDTH, HEADIMAGE_WIDTH));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeadImage)];
        [_headImage addGestureRecognizer:tap];
        
    }
    return _headImage;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.userInteractionEnabled = YES;
        _userNameLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:_userNameLabel];
        __typeof(self) __weak weakSelf = self;
        [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.headImage.mas_top);
            make.size.mas_equalTo(CGSizeMake(DEVICE_WIDTH-CGRectGetMaxX(weakSelf.headImage.frame),LABLE_HEIGHT));
            make.left.equalTo(weakSelf.headImage.mas_right).with.offset(10);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickUserName)];
        [_userNameLabel addGestureRecognizer:tap];
        
    }
    return _userNameLabel;
}

- (UILabel *)rebateLabel
{
    if (!_rebateLabel) {
        _rebateLabel = [[UILabel alloc] init];
        _rebateLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_rebateLabel];
        __typeof(self) __weak weakSelf = self;
        [_rebateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.userNameLabel.mas_bottom);
            make.left.equalTo(weakSelf.userNameLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(LABLE_WIDTH, LABLE_HEIGHT));
            
        }];
    }
    return _rebateLabel;
}

- (UILabel *)couptonLabel//就餐时间
{
    if (!_couptonLabel) {
        _couptonLabel = [[UILabel alloc] init];
        _couptonLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_couptonLabel];
        __typeof(self) __weak weakSelf = self;
        [_couptonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.userNameLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(LABLE_WIDTH, LABLE_HEIGHT));
            make.left.equalTo(weakSelf.rebateLabel.mas_right);
        }];
    }
    return _couptonLabel;
}

- (UILabel *)distanceLabel
{
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc] init];
        _distanceLabel.textAlignment = NSTextAlignmentRight;
        _distanceLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_distanceLabel];
        __typeof(self) __weak weakSelf = self;
        [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.userNameLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(LABLE_WIDTH, LABLE_HEIGHT));
            make.left.equalTo(weakSelf.couptonLabel.mas_right);
        }];
    }
    return _distanceLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:_contentLabel];
        __typeof(self) __weak weakSelf = self;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.distanceLabel.mas_bottom);
            make.left.equalTo(weakSelf.userNameLabel.mas_left);
            make.right.equalTo(weakSelf.contentView).offset(-20);
        }];
    }
    return _contentLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_timeLabel];
        __typeof(self) __weak weakSelf = self;
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.imageArray.count > 0) {
                make.top.mas_equalTo(CGRectGetMaxY(weakSelf.contentLabel.frame)+80);
            }
            else
            {
                make.top.equalTo(weakSelf.contentLabel.mas_bottom).with.offset(10);
            }
            make.left.equalTo(weakSelf.userNameLabel.mas_left);
            make.right.equalTo(weakSelf.contentView).with.offset(-20);;
        }];
    }
    return _timeLabel;
}


- (void)bingDataFrom
{
    self.contentLabel.text = @"三大大大大大大大时达到萨达达大厦大厦大厦大厦大厦大大实打实大大三大大撒大大的撒撒打算打算打算打算的萨达";
    self.timeLabel.text = @"2016-06-20 15:31:20";
    self.distanceLabel.text = @"<100m";
    self.couptonLabel.text = @"10:00-22:00";
    self.rebateLabel.text = @"9.5折";
    self.userNameLabel.text = @"小光头-大胖子大胖子";
}


- (void)clickUserName
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedUserNameBy:)]) {
        [self.delegate clickedUserNameBy:self.tag];
    }
}

- (void)clickHeadImage
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedHeadImageBy:)]) {
        [self.delegate clickedHeadImageBy:self.tag];
    }
}

@end
