//
//  ResponseModel.h
//  YlbOc
//
//  Created by ylb on 2018/3/12.
//  Copyright © 2018年 YLB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseModel : NSObject

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) id extra;

@end

