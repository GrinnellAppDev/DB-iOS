//
//  GADDirectory.h
//  DB
//
//  Created by AppDev on 11/6/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GADDirectory : NSObject

@property (nonatomic, strong) NSArray *people;

-(GADDirectory *)initWithData: (NSData *) data;

@end
