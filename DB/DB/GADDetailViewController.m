//
//  GADDetailViewController.m
//  DB
//
//  Created by AppDev on 10/1/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADDetailViewController.h"

@interface GADDetailViewController ()

@end

@implementation GADDetailViewController {
    NSDictionary *detailField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://appdev.grinnell.edu/members.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        detailField = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", [[detailField valueForKey:@"Alex Mitchell"] valueForKey:@"title"]);
    }];
    
    [task resume];
    
    //NSLog(@"%@", [detailField valueForKey:@"firstName"]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
