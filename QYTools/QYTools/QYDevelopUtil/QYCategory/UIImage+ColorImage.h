//
//  UIImage+ColorImage.h
//  NavigationBarDemo
//
//  Created by 张庆玉 on 17/9/23.
//  Copyright © 2015年 FengFeiYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)horizontalGradientImageWithStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor frame:(CGRect)frame;

@end
