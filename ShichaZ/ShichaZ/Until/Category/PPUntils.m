//
//  PPUntils.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "PPUntils.h"

@implementation PPUntils

+ (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font WithBoundSize:(CGSize)boundSize
{
    if (![string isValid]) {
        return (CGSizeMake(0, 0));
    }
    CGSize size = [string boundingRectWithSize:boundSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}


@end
