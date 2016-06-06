//
//  IndentTextField.m
//  ShichaZ
//
//  Created by Kity_Pei on 16/5/24.
//  Copyright © 2016年 Kity_Pei. All rights reserved.
//

#import "IndentTextField.h"

@implementation IndentTextField

// placeHolder的位置左右缩进15个
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 15, 0);
}

// 文本输入的的位置左右缩进15个
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 15, 0);
}


@end
