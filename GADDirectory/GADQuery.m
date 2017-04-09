//
//  GADQuery.m
//  DB
//
//  Created by Liam li on 3/5/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import "GADQuery.h"

@implementation GADQuery

-(NSDictionary*) dictionaryRepresentation {
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

-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*)password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion {
    NSDictionary *dict = [self dictionaryRepresentation];
    [GADPerson executeWithDict:dict Username:username Password:password completionHandler:completion];
}

@end
