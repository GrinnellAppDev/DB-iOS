//
//  GADPerson.h
//  DB
//
//  Created by AppDev on 10/2/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GADPerson : NSObject

@property (nonatomic) enum {Student, FacStaff, SGA} type;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *reunionYear;
@property (nonatomic, strong) NSString *box;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *address; //on-campus address
@property (nonatomic, strong) NSArray *offCampusAddress; //address1, address2, address3, address4
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *homePhone;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *bldg;
@property (nonatomic, strong) NSString *room;
@property (nonatomic, strong) NSString *spouse;
@property (nonatomic, strong) NSString *alienstatus;
@property (nonatomic, strong) NSString *imgPath; //change to NSURL?
@property (nonatomic, strong) NSString *personType;
@property (nonatomic, strong) NSString *deptMajorClass;

-(GADPerson *)initWithDictionary: (NSDictionary *) dict;


@end
