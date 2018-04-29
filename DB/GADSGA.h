#import "GADStudent.h"

@interface GADSGA : GADStudent
@property (nonatomic, strong) NSString *office_phone;
@property (nonatomic, strong) NSString *office_email;
@property (nonatomic, strong) NSString *office_addr;
@property (nonatomic, strong) NSString *office_box;
@property (nonatomic, strong) NSString *position_name;
@property (nonatomic, strong) NSArray *office_hours;

-(GADSGA *)init;
-(GADSGA *)initWithDictionary: (NSDictionary *) dict;

@end
