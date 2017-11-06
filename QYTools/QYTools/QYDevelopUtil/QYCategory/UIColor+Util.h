//
//  UIColor+Util.h
//  OaProduct
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 shengang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+(UIColor *)colorWithHexString:(NSString *)hexString;

+(NSString *)hexValuesFromUIColor:(UIColor *)color;

@end
