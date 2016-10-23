//
//  GADStudent.m
//  DB
//
//  Created by AppDev on 10/7/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "GADStudent.h"

@implementation GADStudent

-(GADStudent *)initWithDictionary:(NSDictionary *)dict {
    GADStudent *student = [GADStudent alloc];
    student.type = Student;
    student.nickName = [dict valueForKey:@"niceName"];
    student.classYear = [dict valueForKey:@"classYear"];
    student.major = [dict valueForKey:@"major"];
    student.minor = [dict valueForKey:@"minor"];
    student.hiatus = [dict valueForKey:@"hiatus"];
    return student;
}

@end
