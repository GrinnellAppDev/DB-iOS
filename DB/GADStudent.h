#import "GADPerson.h"

@interface GADStudent : GADPerson

@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *classYear;
@property (nonatomic, strong) NSString *major;
@property (nonatomic, strong) NSString *minor;

-(GADStudent *)init;
-(GADStudent *)initWithDictionary: (NSDictionary *) dict;

@end
