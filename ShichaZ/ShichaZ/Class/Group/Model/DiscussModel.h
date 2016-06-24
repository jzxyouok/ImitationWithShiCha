//
//  DiscussModel.h
//  Demo
//
//  Created by Kity_Pei on 16/6/23.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DiscussModel : JSONModel

@property (nonatomic,copy)NSString *id;
@property (nonatomic,copy)NSNumber *businessId;
@property (nonatomic,copy)NSString *businessName;
@property (nonatomic,assign)float latitude;
@property (nonatomic,assign)float longitude;
@property (nonatomic,strong)NSNumber<Optional> *distanse;
@property (nonatomic,strong)NSNumber *decorationGrade;
@property (nonatomic,strong)NSNumber *serviceGrade;
@property (nonatomic,strong)NSNumber *productGrade;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,strong)NSNumber *quality;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,strong)NSNumber *discount;
@property (nonatomic,copy)NSString *couponTime;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSArray<Optional> *images;

@end

@protocol DiscussModel

@end


@interface DiscussResponeseModel : JSONModel

@property (nonatomic,strong)NSNumber *pageNo;
@property (nonatomic,strong)NSNumber *pageSize;
@property (nonatomic,strong)NSNumber *totalSize;
@property (nonatomic,strong)NSNumber *totalPage;
@property (nonatomic,strong)NSArray<DiscussModel>*results;

@end

@interface DiscussResponseStatusModel : JSONModel

@property (nonatomic,strong)NSNumber *code;
@property (nonatomic,strong)NSString *msg;
@property (nonatomic,strong)DiscussResponeseModel *result;

@end
