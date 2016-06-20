//
//  GroupTableViewCell.h
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/15.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GroupTableViewCellDelegate <NSObject>

- (void)clickedHeadImageBy:(NSInteger)index;

- (void)clickedUserNameBy:(NSInteger)index;

@end



@interface GroupTableViewCell : UITableViewCell

@property (nonatomic,weak)id<GroupTableViewCellDelegate> delegate;

- (void)bingDataFrom;

@end
