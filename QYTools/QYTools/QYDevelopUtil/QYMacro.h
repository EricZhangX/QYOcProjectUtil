//
//  QYMacro.h
//  SleepPillow
//
//  Created by 张庆玉 on 25/05/2017.
//  Copyright © 2017 MWellness. All rights reserved.
//

#ifndef QYMacro_h
#define QYMacro_h

#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#else
#   define NSLog(...) (void)0
#endif

#define MainScreenHeight      [[UIScreen mainScreen] bounds].size.height
#define MainScreenWidth       [[UIScreen mainScreen] bounds].size.width

//** 沙盒路径 ***********************************************************************************
#define PathOfHome          NSHomeDirectory()
#define PathOfTemp          [NSHomeDirectory() stringByAppendingPathComponent:@"temp"]
#define PathOfDocuments     [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define PathOfLibrary       [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
#define PathOfCaches        [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]

//** NSUserDefault ***********************************************************************************
#define QYUserDefaults      [NSUserDefaults standardUserDefaults]

#endif /* QYMacro_h */
