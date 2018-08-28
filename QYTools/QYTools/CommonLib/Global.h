//
//  Global.h
//  QYTools
//
//  Created by ylb on 2018/8/28.
//  Copyright © 2018年 张庆玉. All rights reserved.
//

#ifndef Global_h
#define Global_h

//主窗口的宽、高
#define kMainScreenWidth  MainScreenWidth()
#define kMainScreenHeight MainScreenHeight()

#define Localized(Str) NSLocalizedString(Str, Str)

static __inline__ CGFloat MainScreenWidth() {
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;
}

static __inline__ CGFloat MainScreenHeight() {
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
}






#define TIMELog(fmt, ...) {\
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];\
[dateFormatter setDateStyle:NSDateFormatterMediumStyle];\
[dateFormatter setTimeStyle:NSDateFormatterShortStyle];\
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];\
[[TIMManager sharedInstance] log:TIM_LOG_INFO tag:@"时间统计" msg:[NSString stringWithFormat:(@"[%s Line %d] 时间点:%@ \n" fmt), __PRETTY_FUNCTION__, __LINE__, [dateFormatter stringFromDate:[NSDate date]], ##__VA_ARGS__]];\
}


//角度与弧度转换
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(x) (180.0 * (x) / M_PI)

//判断设备是否是ipad
#define isiPad        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//** NSUserDefault ***********************************************************************************
#define UserDefaults [NSUserDefaults standardUserDefaults]

#endif /* Global_h */
