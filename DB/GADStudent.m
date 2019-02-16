#import "GADStudent.h"
#import <GADDirectory/GADPerson.h>
#import "GADSGA.h"

@implementation GADStudent

-(GADStudent *)init{
    if (self = [super init]){
        self.type = Student;
    }
    return self;
}

-(GADStudent *)initWithDictionary:(NSDictionary *)dict {
    GADStudent *student;
    if ([dict valueForKey:@"office_email"] == (id)[NSNull null]) { // need to check
        student = [GADStudent alloc];
        student.type = Student;
    } else {
        student = [[GADSGA alloc] initWithDictionary:dict];
    }
    
    student.nickName = [dict valueForKey:@"nickName"];
    student.classYear = [dict valueForKey:@"classYear"];
    student.major = [dict valueForKey:@"major"];
    student.minor = [dict valueForKey:@"minor"];
    return student;
}
@end
