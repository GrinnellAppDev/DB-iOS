//
//  GADDirectory.m
//  DB
//
//  Created by AppDev on 11/6/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADDirectory.h"
#import "GADPerson.h"

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
    
    /*data = [{
        
        "firstName": "Cheyenne",
        
        "nickName": null,
        
        "lastName": "White",
        
        "userName": null,
        
        "classYear": "2018",
        
        "reunionYear": null,
        
        "box": "4725",
        
        "email": "whiteche@grinnell.edu",
        
        "major": "Gender, Womens, & Sexuality St",
        
        "minor": null,
        
        "address": "1315 Main Hall",
        
        "address1": "6714 Bellaire Dr",
        
        "address2": null,
        
        "address3": null,
        
        "address4": null,
        
        "phone": null,
        
        "homePhone": null,
        
        "city": "New Orleans",
        
        "state": "LA",
        
        "zip": "70124-1534",
        
        "country": null,
        
        "bldg": null,
        
        "room": null,
        
        "spouse": null,
        
        "alienStatus": null,
        
        "hiatus": null,
        
        "imgPath": "https://itwebapps.grinnell.edu/PcardImages/moved/99808.jpg",
        
        "office_phone": null,
        
        "office_email": null,
        
        "office_addr": null,
        
        "office_box": null,
        
        "type": null,
        
        "page_order": null,
        
        "crs_ID": null,
        
        "position_name": null,
        
        "office_hours_1": null,
        
        "office_hours_2": null,
        
        "office_hours_3": null,
        
        "office_hours_4": null,
        
        "personType": "Student",
        
        "deptMajorClass": null,
        
        "title": null,
        
        "title2": null,
        
        "title3": null,
        
        "title4": null,
        
        "title5": null,
        
        "title6": null,
        
        "title7": null,
        
        "title8": null
        
    },
     
    {
        
        "firstName": "Summer",
        
        "nickName": null,
        
        "lastName": "White",
        
        "userName": null,
        
        "classYear": "2018",
        
        "reunionYear": null,
        
        "box": "4736",
        
        "email": "whitesum@grinnell.edu",
        
        "major": "Political Science",
        
        "minor": "Policy Studies",
        
        "address": "2349 Hannibal Kershaw Hall",
        
        "address1": "2104 Mount Ephriam Road",
        
        "address2": null,
        
        "address3": null,
        
        "address4": null,
        
        "phone": null,
        
        "homePhone": null,
        
        "city": "Adamstown",
        
        "state": "MD",
        
        "zip": "21710",
        
        "country": null,
        
        "bldg": null,
        
        "room": null,
        
        "spouse": null,
        
        "alienStatus": null,
        
        "hiatus": null,
        
        "imgPath": "https://itwebapps.grinnell.edu/PcardImages/moved/82579.jpg",
        
        "office_phone": "4318",
        
        "office_email": "sgamoney",
        
        "office_addr": null,
        
        "office_box": null,
        
        "type": null,
        
        "page_order": null,
        
        "crs_ID": null,
        
        "position_name": null,
        
        "office_hours_1": "Monday: 1-2PM Office",
        
        "office_hours_2": "Tuesday: 11AM-12PM Office",
        
        "office_hours_3": "Friday: 3-4PM Office",
        
        "office_hours_4": "Sunday: 3-4PM Office",
        
        "personType": "Student",
        
        "deptMajorClass": null,
        
        "title": null,
        
        "title2": null,
        
        "title3": null,
        
        "title4": null,
        
        "title5": null,
        
        "title6": null,
        
        "title7": null,
        
        "title8": null
        
    }];*/

    NSArray *arrayOfDictionary;
    arrayOfDictionary = [[NSArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]];
    NSMutableArray *arrayOfPerson = [[NSMutableArray alloc]init];
    for (int i=0; i<arrayOfDictionary.count; i++) {
        arrayOfPerson[i] = [[GADPerson alloc] initWithDictionary:arrayOfDictionary[i]];
    }
    directory.people = [[NSArray alloc] initWithArray:arrayOfPerson];
    //NSLog(@"%@", [directory.people[0] valueForKey:@"firstName"]);
    
    return directory;
}

@end
