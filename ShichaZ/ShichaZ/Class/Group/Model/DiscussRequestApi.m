//
//  DiscussRequestApi.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/6/23.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "DiscussRequestApi.h"

@implementation DiscussRequestApi
{
    NSString *_city;
    NSString *_pageNo;
    NSString *_sign;
}


- (id)initWithCity:(NSString *)city pageNo:(NSString *)pageNo sign:(NSString *)sign
{
    self = [super init];
    if (self) {
        _city = city;
        _pageNo = pageNo;
        _sign = sign;
    }
    return self;
}

- (NSString *)requestUrl
{
    return @"found/getFounds";
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGet;
}

- (id)requestArgument
{
    return @{
             @"city":_city,
             @"pageNo":_pageNo,
             @"sign":_sign
             };
}

@end
