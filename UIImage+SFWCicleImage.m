//
//  UIImage+SFWCicleImage.m
//  
//
//  Created by 沈方武 on 15/8/16.
//  Copyright (c) 2015年 SanMao-SF5. All rights reserved.
//

#import "UIImage+SFWCicleImage.h"

@implementation UIImage (SFWCicleImage)

- (instancetype)circleImage{

    // 开启一个和图片同样大小的上下文
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 画圆
    CGContextAddEllipseInRect(context, rect);
    
    // 裁剪
    CGContextClip(context);
    
    // 把图片画到圆上
    [self drawInRect:rect];
    
    // 从上下文生成一张画好的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
