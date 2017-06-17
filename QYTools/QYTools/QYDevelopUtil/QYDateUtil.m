//
//  QYDateUtil.m
//  QYTools
//
//  Created by 张庆玉 on 2017/5/8.
//  Copyright © 2017年 张庆玉. All rights reserved.
//

#import "QYDateUtil.h"

@implementation QYDateUtil
// 获取时间戳
+ (NSTimeInterval)getTimeStampWithDate:(NSDate *)date {
    NSTimeInterval interval = [date timeIntervalSince1970];
    return interval;
}

//获取格式化日期
+ (NSString *)getDateStrWithDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

// 获取日期
+ (NSDate *)getDateWithDateStr:(NSString *)dateStr format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateStr];
    return date;
}

// 转换某天的格式
+ (NSString *)getDateStrWithSourceDateStr:(NSString *)sourceDateStr sourceFormat:(NSString *)sourceFormat targetFormat:(NSString *)targetFormat {
    NSDate *sourceDate = [self getDateWithDateStr:sourceDateStr format:sourceFormat];
    NSString *targetDateStr = [self getDateStrWithDate:sourceDate format:targetFormat];
    return targetDateStr;
}

// 将指定日期转换成农历
+ (NSString *)getTraditionalDateWithDate:(NSDate *)date {
    NSArray *tMonthes = @[@"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"冬月", @"腊月"];
    
    NSArray *tDays = @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                       @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                       @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
    
    NSCalendar *tCalender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSCalendarUnit tFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *tComp = [tCalender components:tFlags fromDate:date];
    NSString *tMonthStr = tMonthes[tComp.month - 1];
    NSString *tDayStr = tDays[tComp.day - 1];
    NSString *tYearStr = [[date description]substringToIndex:4];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setCalendar:tCalender];
    [df setDateFormat:@"MM"];
    NSString *tDateStr = [df stringFromDate:date];
    tDateStr = [NSString stringWithFormat:@"%@-%@-%@", tYearStr, tMonthStr, tDayStr];
    
    return tDateStr;
}

#pragma mark -
// 获取某天的年份
+ (NSInteger)getYearWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear fromDate:date];
    return dateComponents.year;
}

// 获取某天的季度
+ (NSInteger)getQuarterWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitQuarter fromDate:date];
    return dateComponents.year;
}

// 获取某天的月份
+ (NSInteger)getMonthWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitMonth fromDate:date];
    return dateComponents.month;
}

// 获取某天是本月的第几周
+ (NSInteger)getWeekOfMonthWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitWeekOfMonth fromDate:date];
    return dateComponents.weekOfMonth;
}

// 获取某天是几号
+ (NSInteger)getDayWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitDay fromDate:date];
    return dateComponents.day;
}

// 获取某个时刻是几点
+ (NSInteger)getHourWithDate:(NSDate *)date {
    NSString *dateStr = [self getDateStrWithDate:date format:@"HH"];
    return [dateStr integerValue];
}

// 获取某个时刻是几分
+ (NSInteger)getMinuteWithDate:(NSDate *)date {
    NSString *dateStr = [self getDateStrWithDate:date format:@"mm"];
    return [dateStr integerValue];
}

// 获取某个时刻是几秒
+ (NSInteger)getSecondWithDate:(NSDate *)date {
    NSString *dateStr = [self getDateStrWithDate:date format:@"ss"];
    return [dateStr integerValue];
}

// 获取某天是周几
+ (NSInteger)getWeekDayWithDate:(NSDate *)date {
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitWeekday fromDate:date];
    return dateComponents.weekday;
}

// 获取某一日期之前的七天的日期数组
+ (NSArray<NSDate *> *)getLastSevenDaysOfTheDate:(NSDate *)date {
    NSMutableArray *daysArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 7; i ++) {
        NSTimeInterval secondsPerDay = -i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeInterval:secondsPerDay sinceDate:date];
        [daysArr insertObject:curDate atIndex:0];
    }
    return daysArr;
}

// 获取某一日期所在的星期的日期数组
+ (NSArray<NSDate *> *)getWeekDaysOfTheDate:(NSDate *)date {
    NSMutableArray *daysArr = [[NSMutableArray alloc] init];
    NSInteger weekDay = [self getWeekDayWithDate:date];
    
    for (int i = 1; i <= 7; i ++) {
        NSInteger j = i - weekDay;
        NSTimeInterval secondsPerDay = j * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeInterval:secondsPerDay sinceDate:date];
        [daysArr addObject:curDate];
    }
    return daysArr;
}

+ (NSDate *)getLastDayOfMonthWithDate:(NSDate *)date {

    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&beginDate interval:&interval forDate:date];
    if (ok) {
        endDate = [beginDate dateByAddingTimeInterval:interval-1];
        return endDate;
    }else {
        return nil;
    }
}


@end






