//
//  QYAFNetWork.h
//  QYTools
//
//  Created by 张庆玉 on 15/05/2017.
//  Copyright © 2017 张庆玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define RequestTimeOut    30  // 请求超时时间

typedef void (^SuccessBlock)  (id responseObj);
typedef void (^ProgressBlock) (NSProgress *progress);
typedef void (^FailureBlock)  (NSError *error);
typedef void (^DownloadBlock) (NSURLResponse *response, NSURL *filePath, NSError *error);

@interface QYAFNetWork : NSObject


/**
 Get请求基础方法

 @param url url路径
 @param params 参数
 @param header 请求头
 @param progressCallBack 数据下传进度
 @param sucessCallBack 成功回调
 @param failureCallBack 失败回调
 */
+ (void)getRequestWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                   header:(NSDictionary *)header
          prgressCallBack:(ProgressBlock)progressCallBack
          successCallBack:(SuccessBlock)sucessCallBack
          failureCallBack:(FailureBlock)failureCallBack;

/**
 Post请求基础方法
 
 @param url url路径
 @param params 参数
 @param header 请求头
 @param progressCallBack 数据下传进度
 @param sucessCallBack 成功回调
 @param failureCallBack 失败回调
 */
+ (void)postRequestWithUrl:(NSString *)url
                    params:(NSDictionary *)params
                    header:(NSDictionary *)header
           prgressCallBack:(ProgressBlock)progressCallBack
           successCallBack:(SuccessBlock)sucessCallBack
           failureCallBack:(FailureBlock)failureCallBack;


/**
 上传数据

 @param url url路径
 @param params 参数
 @param header 请求头
 @param formDataBlock 数据
 @param progressCallBack 数据上传进度
 @param sucessCallBack 成功回调
 @param failureCallBack 失败回调
 */
+ (void)uploadDataWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                   header:(NSDictionary *)header
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
          prgressCallBack:(ProgressBlock)progressCallBack
          successCallBack:(SuccessBlock)sucessCallBack
          failureCallBack:(FailureBlock)failureCallBack;

+ (void)downloadDataWithUrl:(NSString *)url
                   progress:(ProgressBlock)progressCallBack
                destination:(NSString *)targetLocalPath
          completionHandler:(DownloadBlock)complateCallBack;

@end

















