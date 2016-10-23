//
//  GADFacStaff.h
//  DB
//
//  Created by AppDev on 10/7/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADPerson.h"

@interface GADFacStaff : GADPerson
@property (nonatomic, strong) NSArray *title; //title, title2, ... title8. title5 correspond to Department(s).

-(GADFacStaff *)initWithDictionary: (NSDictionary *) dict;

@end
