//
//  GroupTableViewCell.h
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/15.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscussModel.h"
@protocol GroupTableViewCellDelegate <NSObject>

- (void)clickedHeadImageBy:(NSInteger)index;

- (void)clickedUserNameBy:(NSInteger)index;

@end



@interface GroupTableViewCell : UITableViewCell
{
    float bottomHeight;
}
@property (nonatomic,weak)id<GroupTableViewCellDelegate> delegate;
@property (nonatomic,strong)UILabel *timeLabel;//评价时间

- (void)bingDataFrom:(DiscussModel *)model;


- (CGFloat)heightOfRow;

@end
