#import "GADStudent.h"
#import <GADDirectory/GADPerson.h>

@implementation GADStudent

-(GADStudent *)init{
    if (self = [super init]){
        self.type = Student;
    }
    return self;
}

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
