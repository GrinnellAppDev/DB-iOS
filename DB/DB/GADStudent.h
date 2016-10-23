//
//  GADStudent.h
//  DB
//
//  Created by AppDev on 10/7/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADPerson.h"

@interface GADStudent : GADPerson

@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *classYear;
@property (nonatomic, strong) NSString *major;
@property (nonatomic, strong) NSString *minor;
@property (nonatomic, strong) NSString *hiatus;

-(GADStudent *)initWithDictionary: (NSDictionary *) dict;

@end
