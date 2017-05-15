//
//  AFNetworkingDefaultVC.m
//  QYTools
//
//  Created by 张庆玉 on 15/05/2017.
//  Copyright © 2017 张庆玉. All rights reserved.
//

#import "AFNetworkingDefaultVC.h"
#import <AFNetworking.h>
#import "UIPlaceHolderTextView.h"


@interface AFNetworkingDefaultVC ()
@property (weak, nonatomic) IBOutlet UIPlaceHolderTextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation AFNetworkingDefaultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getRequest:(id)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.douban.com/v2/movie/in_theaters" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"--%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)postRequest:(id)sender {
    
}

- (IBAction)downloadRequest:(id)sender {
    
}

- (IBAction)uploadRequest:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
