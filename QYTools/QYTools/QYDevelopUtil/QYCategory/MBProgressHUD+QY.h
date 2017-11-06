//
//  MBProgressHUD+QY.h
//  SleepPillow
//
//  Created by 张庆玉 on 08/06/2017.
//  Copyright © 2017 MWellness. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (QY)

+ (void)showToast:(NSString *)toast toView:(UIView *)view;

+ (void)showToast:(NSString *)toast toView:(UIView *)view dismiss:(float)delay;

+ (void)showAutoDismissLoadingToView:(UIView *)view;

+ (void)showLoadingToView:(UIView *)view;

+ (void)hidLoadingFromView:(UIView *)view;

@end
