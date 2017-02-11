#import "GADPerson.h"

@interface GADStudent : GADPerson

@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *classYear;
@property (nonatomic, strong) NSString *major;
@property (nonatomic, strong) NSString *minor;
@property (nonatomic, strong) NSString *hiatus;

-(GADStudent *)initWithDictionary: (NSDictionary *) dict;

@end
