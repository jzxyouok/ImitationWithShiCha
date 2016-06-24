//
//  DiscussRequestApi.h
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/23.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

//#import <YTKNetwork/YTKNetwork.h>

@interface DiscussRequestApi : YTKRequest

- (id)initWithCity:(NSString *)city pageNo:(NSString *)pageNo sign:(NSString *)sign;

@end
