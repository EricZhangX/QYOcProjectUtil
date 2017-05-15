//
//  QYAFNetWork.m
//  QYTools
//
//  Created by 张庆玉 on 15/05/2017.
//  Copyright © 2017 张庆玉. All rights reserved.
//

#import "QYAFNetWork.h"

@implementation QYAFNetWork

// GetRequest
+ (void)getRequestWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                   header:(NSDictionary *)header
          prgressCallBack:(ProgressBlock)progressCallBack
          successCallBack:(SuccessBlock)sucessCallBack
          failureCallBack:(FailureBlock)failureCallBack {
    
    [self printRequestDataWithUrl:url params:params];
    
    AFHTTPSessionManager *manager = [self getHTTPSessionManagerWithHeaer:header httpsCerData:nil cerPwd:nil];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progressCallBack(downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功处理
        [self printResponseDataWithUrl:url params:params responseData:responseObject];
        sucessCallBack(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败处理
        [self printFailureMsgWithUrl:url params:params error:error];
        failureCallBack(error);
        
    }];
}

// PostRequest
+ (void)postRequestWithUrl:(NSString *)url
                    params:(NSDictionary *)params
                    header:(NSDictionary *)header
           prgressCallBack:(ProgressBlock)progressCallBack
           successCallBack:(SuccessBlock)sucessCallBack
           failureCallBack:(FailureBlock)failureCallBack {
    
    [self printRequestDataWithUrl:url params:params];
    
    AFHTTPSessionManager *manager = [self getHTTPSessionManagerWithHeaer:header httpsCerData:nil cerPwd:nil];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progressCallBack(downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功处理
        [self printResponseDataWithUrl:url params:params responseData:responseObject];
        
        sucessCallBack(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败处理
        [self printFailureMsgWithUrl:url params:params error:error];
        failureCallBack(error);
    }];
}

// upload
+ (void)uploadDataWithUrl:(NSString *)url
                   params:(NSDictionary *)params
                   header:(NSDictionary *)header
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formDataBlock
          prgressCallBack:(ProgressBlock)progressCallBack
          successCallBack:(SuccessBlock)sucessCallBack
          failureCallBack:(FailureBlock)failureCallBack {
    
    [self printRequestDataWithUrl:url params:params];
    
    AFHTTPSessionManager *manager = [self getHTTPSessionManagerWithHeaer:header httpsCerData:nil cerPwd:nil];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        formDataBlock(formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progressCallBack(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self printResponseDataWithUrl:url params:params responseData:responseObject];
        sucessCallBack(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self printFailureMsgWithUrl:url params:params error:error];
        failureCallBack(error);
        
    }];
}

// download
+ (void)downloadDataWithUrl:(NSString *)url
                   progress:(ProgressBlock)progressCallBack
                destination:(NSString *)targetLocalPath
          completionHandler:(DownloadBlock)complateCallBack{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progressCallBack(downloadProgress);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (targetLocalPath) {
            return [NSURL fileURLWithPath:targetLocalPath];
        } else {
            return targetPath;
        }

    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        complateCallBack(response,filePath,error);
    }];

    [task resume];
}

#pragma mark - 获取AFHTTPSessionManager
+ (AFHTTPSessionManager *)getHTTPSessionManagerWithHeaer:(NSDictionary *)header httpsCerData:(NSData *)httpsCerData cerPwd:(NSString *)cerPwd {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = RequestTimeOut;
    //    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    if (httpsCerData) {
        AFSecurityPolicy *securityPolicy = [self getSecurityPolicyWithHttpsCerData:httpsCerData cerPwd:cerPwd];
        manager.securityPolicy = securityPolicy;
    } else {
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]; // 不进行https验证
    }
    if (header && header.allKeys.count > 0) {
        for (id key in header.allKeys) {
            id value = [header objectForKey:key];
            [manager.requestSerializer setValue:value forHTTPHeaderField:key];
        }
#ifdef DEBUG
        NSLog(@"请求头：%@", manager.requestSerializer.HTTPRequestHeaders);
#endif
    }
    return manager;
}

+ (AFSecurityPolicy *)getSecurityPolicyWithHttpsCerData:(NSData *)httpsCerData cerPwd:(NSString *)cerPwd {
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = NO;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    //    NSArray *cerArray = @[httpsCerData];
    NSSet *cerSet = [[NSSet alloc] initWithObjects:httpsCerData, nil];
    securityPolicy.pinnedCertificates = cerSet;
    
    return securityPolicy;
}


#pragma mark - 打印调试信息
+ (void)printRequestDataWithUrl:(NSString *)url params:(NSDictionary *)params {
    
    NSLog(@"\n/************ 请求报文 ************/ \n"
          "request: \n"
          "{ \n  "
          "url:%@, \n  "
          "params:%@, \n  "
          "} \n"
          "********************************* \n",
          url,
          [params description]);
    
}

+ (void)printResponseDataWithUrl:(NSString *)url params:(NSDictionary *)params responseData:(id)responseData {
    
    NSString *jsonStr = @"";
    if (responseData) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseData
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:nil];
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSLog(@"\n/************ 回复报文 ************/ \n"
          "response: %@\n"
          "{ \n  "
          "url:%@, \n  "
          "params:%@, \n  "
          "} \n"
          "********************************* \n",
          jsonStr,
          url,
          [params description]);
    
}

+ (void)printFailureMsgWithUrl:(NSString *)url params:(NSDictionary *)params error:(NSError *)error {
    
    NSLog(@"\n/************ 网络请求错误信息 ************/ \n"
          "error: %@\n"
          "{ \n  "
          "url:%@, \n  "
          "params:%@, \n  "
          "} \n"
          "********************************* \n",
          error,
          url,
          [params description]);
    
}



@end




















