//
//  QYNativeNetWork.h
//  QYTools
//
//  Created by 张庆玉 on 15/05/2017.
//  Copyright © 2017 张庆玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYNativeNetWork : NSObject<NSURLSessionDelegate>

/**
 * 原生post请求（NSURLSession）JSON解析
 */

+ (void)postRequestByServiceUrl:(NSString *)service
                         andApi:(NSString *)api
                      andParams:(NSDictionary *)params
                    andCallBack:(void (^)(id obj))callback;

/**
 * 原生get请求（NSURLSession）JSON解析
 */
+ (void)getRequestByServiceUrl:(NSString *)service
                        andApi:(NSString *)api
                     andParams:(NSDictionary *)params
                   andCallBack:(void (^)(id obj))callback;

///**
// * 原生上传数据
// */
//+ (void) uploadDataWithBaseApi:(NSString *)baseApi
//                        params:(NSDictionary *)params
//                    uploadData:(NSData *)uploadData
//                   Completion:(void (^) (id obj))completion;
//
///**
// * 原生下载
// */
//+ (void) postImageWithBaseApi:(NSString *)baseApi
//                   AndPragram:(NSDictionary *)pragram
//                   updatImage:(UIImage *)image
//                   Completion:(void (^) (id obj))completion;


@end













