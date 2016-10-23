//
//  GADDetailViewController.m
//  DB
//
//  Created by AppDev on 10/1/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADDetailViewController.h"
#import "GADPerson.h"

@interface GADDetailViewController ()

@end

@implementation GADDetailViewController {
    NSDictionary *detailField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //The following dictionary is just for testing.
    detailField = @{
                    @"firstName": @"Cheyenne",
                    
                    @"nickName": @"",
                    
                    @"lastName": @"White",
                    
                    @"userName": @"",
                    
                    @"classYear": @"2018",
                    
                    @"reunionYear": @"",
                    
                    @"box": @"4725",
                    
                    @"email": @"whiteche@grinnell.edu",
                    
                    @"major": @"Gender, Womens, & Sexuality St",
                    
                    @"minor": @"",
                    
                    @"address": @"1315 Main Hall",
                    
                    @"address1": @"6714 Bellaire Dr",
                    
                    @"address2": @"",
                    
                    @"address3": @"",
                    
                    @"address4": @"",
                    
                    @"phone": @"",
                    
                    @"homePhone": @"",
                    
                    @"city": @"New Orleans",
                    
                    @"state": @"LA",
                    
                    @"zip": @"70124-1534",
                    
                    @"country": @"",
                    
                    @"bldg": @"",
                    
                    @"room": @"",
                    
                    @"spouse": @"",
                    
                    @"alienStatus": @"",
                    
                    @"hiatus": @"",
                    
                    @"imgPath": @"https://itwebapps.grinnell.edu/PcardImages/moved/99808.jpg",
                    
                    @"office_phone": @"",
                    
                    @"office_email": @"",
                    
                    @"office_addr": @"",
                    
                    @"office_box": @"",
                    
                    @"type": @"",
                    
                    @"page_order": @"",
                    
                    @"crs_ID": @"",
                    
                    @"position_name": @"",
                    
                    @"office_hours_1": @"",
                    
                    @"office_hours_2": @"",
                    
                    @"office_hours_3": @"",
                    
                    @"office_hours_4": @"",
                    
                    @"personType": @"Student",
                    
                    @"deptMajorClass": @"",
                    
                    @"title": @"",
                    
                    @"title2": @"",
                    
                    @"title3": @"",
                    
                    @"title4": @"",
                    
                    @"title5": @"",
                    
                    @"title6": @"",
                    
                    @"title7": @"",
                    
                    @"title8": @"",
                    
                    };
    GADPerson *person =[[GADPerson alloc] initWithDictionary: detailField];
    
    //NSLog(@"#personType = %@\n", person.personType); //for testing
    //NSLog(@"#personType = %u\nlast name = %@\n", person.type, person.lastName); //for testing
    /*   //Question: Is the json file translated into a dictionary that each item is a dictionary of one person?
    NSString *urlString = @"http://appdev.grinnell.edu/members.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        detailField = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@", [[detailField valueForKey:@"Alex Mitchell"] valueForKey:@"title"]);
    }];
    
    [task resume];
    
    //NSLog(@"%@", [detailField valueForKey:@"firstName"]);
    */
    
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
