//
//  GADDirectory.m
//  DB
//
//  Created by AppDev on 11/6/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADDirectory.h"

@implementation GADDirectory

-(GADDirectory *)initWithData:(NSData *)data {
    GADDirectory *directory = [[GADDirectory alloc] init];
    /*
     NSString *urlString = @"http://appdev.grinnell.edu/members.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        detailField = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", [[detailField valueForKey:@"Alex Mitchell"] valueForKey:@"title"]);
    }];
    
    [task resume];
    
    //NSLog(@"%@", [detailField valueForKey:@"firstName"]);
    */
    
    
    directory.people = [[NSArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]];
    NSLog(@"%@", [directory.people[0] valueForKey:@"firstName"]);
    return directory;
}

@end
