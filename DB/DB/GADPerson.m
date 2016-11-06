//
//  GADPerson.m
//  DB
//
//  Created by AppDev on 10/2/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADPerson.h"
#import "GADStudent.h"
#import "GADSGA.h"
#import "GADFacStaff.h"

@implementation GADPerson

-(GADPerson *)initWithDictionary: (NSDictionary *) dict {
    GADPerson *person;
    if ([[dict valueForKey:@"personType"] isEqual: @"Student"]) {
        if ([[dict valueForKey:@"office_email"] isEqual: @""]) { // need to check
            person = [[GADStudent alloc] initWithDictionary:dict];
        } else {
            person = [[GADSGA alloc] initWithDictionary:dict];
        }
    } else {
        person = [[GADFacStaff alloc] initWithDictionary:dict];
    }
    person.lastName = [dict valueForKey:@"lastName"];
    person.firstName = [dict valueForKey:@"firstName"];
    person.userName = [dict valueForKey:@"userName"];
    person.reunionYear = [dict valueForKey:@"reunionYear"];
    person.box = [dict valueForKey:@"box"];
    person.email = [dict valueForKey:@"email"];
    person.address = [dict valueForKey:@"address"];
    person.offCampusAddress = @[[dict valueForKey:@"address1"], [dict valueForKey:@"address2"], [dict valueForKey:@"address3"], [dict valueForKey:@"address4"]];
    person.phone = [dict valueForKey:@"phone"];
    person.homePhone = [dict valueForKey:@"homePhone"];
    person.city = [dict valueForKey:@"city"];
    person.state = [dict valueForKey:@"state"];
    person.zip = [dict valueForKey:@"zip"];
    person.country = [dict valueForKey:@"country"];
    person.bldg = [dict valueForKey:@"bldg"];
    person.room = [dict valueForKey:@"room"];
    person.spouse = [dict valueForKey:@"spouse"];
    person.alienstatus = [dict valueForKey:@"alienstatus"];
    person.imgPath = [NSURL URLWithString:[dict valueForKey:@"imgPath"]];
    person.address = [dict valueForKey:@"address"];
    person.personType = [dict valueForKey:@"personType"];
    person.address = [dict valueForKey:@"address"];
    person.deptMajorClass = [dict valueForKey:@"deptMajorClass"];

    return person;
}

@end
