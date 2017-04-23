#import "GADStudent.h"

@interface GADSGA : GADStudent
@property (nonatomic, strong) NSString *office_phone;
@property (nonatomic, strong) NSString *office_email;
@property (nonatomic, strong) NSString *office_addr;
@property (nonatomic, strong) NSString *office_box;
@property (nonatomic, strong) NSArray *office_hours; //office_hours_1...4;

-(GADSGA *)init;
-(GADSGA *)initWithDictionary: (NSDictionary *) dict;

@end
