//
//  GADQuery.m
//  DB
//
//  Created by Liam li on 3/5/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import "GADQuery.h"

@implementation GADQuery

-(void)setlastName: (NSString*) lastName{
    self.lastName=lastName;
}
-(void)setfirstName: (NSString*) firstName {
    self.firstName=firstName;
}

-(void)setcampusAddressOrPOBox: (NSString*) campusAddressOrPOBox{
    self.campusAddressOrPOBox=campusAddressOrPOBox;
}

-(void)setFacStaffDeptOffice: (NSString*) FacStaffDeptOffice{
    self.FacStaffDeptOffice=FacStaffDeptOffice;
}
-(void)setstudentMajor: (NSString*) studentMajor{
    self.studentMajor=studentMajor;
}
-(void)sethiatus: (NSString*) hiatus{
    self.hiatus=hiatus;
}
-(void)setcomputerUsername: (NSString*)computerUsername{
    self.computerUsername=computerUsername;
}
-(void)setcampusPhone: (NSString*)campusPhone{
    self.campusPhone=campusPhone;
}
-(void)sethomeAddress: (NSString*)homeAddress{
    self.homeAddress=homeAddress;
}
-(void)setSGA: (NSString*) SGA{
    self.SGA=SGA;
}
-(void)setconcentration: (NSString*)concentration{
    self.concentration=concentration;
}
-(void)setstudentClass: (NSString*) studentClass{
    self.studentClass=studentClass;
}

-(NSDictionary*) convertQueryObejectToDict{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (self.lastName) [dict setValue:self.lastName forKey:@"lastName"];
    if (self.firstName) [dict setValue:self.firstName forKey:@"firstName"];
    if (self.campusAddressOrPOBox) [dict setValue:self.campusAddressOrPOBox forKey:@"box"];
    if (self.FacStaffDeptOffice) [dict setValue:self.FacStaffDeptOffice forKey:@"titkle5"];
    if (self.studentMajor) [dict setValue:self.studentMajor forKey:@"major"];
    if (self.hiatus) [dict setValue:self.hiatus forKey:@"hiatus"];
    if (self.computerUsername) [dict setValue:self.computerUsername forKey:@"userName"];
    if (self.campusPhone) [dict setValue:self.campusPhone forKey:@"office_phone"];
    if (self.homeAddress) [dict setValue:self.homeAddress forKey:@"adrees"];
    if (self.SGA) [dict setValue:self.SGA forKey:@"title"];
    if (self.concentration) [dict setValue:self.concentration forKey:@"minor"];
    if (self.studentClass)[dict setValue:self.studentClass forKey:@"classYear"];
    return dict;
}

-(void) fetchPersonInfoWithUsername:(NSString*)username
                           Password:(NSString*) password
                  completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion{
    NSDictionary *dict = [self convertQueryObejectToDict];
    [GADPerson fetchPersonInfoWithCriteria:dict Username:username Password:password completionHandler:completion];
}
@end
