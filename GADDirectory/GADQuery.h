//
//  GADQuery.h
//  DB
//
//  Created by Liam li on 3/5/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADPerson.h"

@interface GADQuery : NSObject

@property (nullable,nonatomic, strong) NSString *lastName;
@property (nullable,nonatomic, strong) NSString *firstName;
@property (nullable,nonatomic, strong) NSString *campusAddressOrPOBox;
@property (nullable,nonatomic, strong) NSString *FacStaffDeptOffice;
@property (nullable,nonatomic, strong) NSString *studentMajor;
@property (nullable,nonatomic, strong) NSString *hiatus;
@property (nullable,nonatomic, strong) NSString *computerUsername;
@property (nullable,nonatomic, strong) NSString *campusPhone;
@property (nullable,nonatomic, strong) NSString *homeAddress;
@property (nullable,nonatomic, strong) NSString *SGA;
@property (nullable,nonatomic, strong) NSString *concentration;
@property (nullable,nonatomic, strong) NSString *studentClass;

-(void)setlastName: (nonnull NSString*) lastName;
-(void)setfirstName: (nonnull NSString*) firstName;
-(void)setcampusAddressOrPOBox: (nonnull NSString*) campusAddressOrPOBox;
-(void)setFacStaffDeptOffice: (nonnull NSString*) FacStaffDeptOffice;
-(void)setstudentMajor: (nonnull NSString*) studentMajor;
-(void)sethiatus: (nonnull NSString*) hiatus;
-(void)setcomputerUsername: (nonnull NSString*)computerUsername;
-(void)setcampusPhone: (nonnull NSString*)campusPhone;
-(void)sethomeAddress: (nonnull NSString*)homeAddress;
-(void)setSGA: (nonnull NSString*) SGA;
-(void)setconcentration: (nonnull NSString*)concentration;
-(void)setstudentClass: (nonnull NSString*) studentClass;

-(nonnull NSDictionary*) convertQueryObejectToDict;

-(void) fetchPersonInfoWithUsername:(nonnull NSString*)username
                           Password:(nonnull NSString*) password
                  completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion;

           @end
