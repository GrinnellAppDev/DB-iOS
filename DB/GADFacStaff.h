#import <GADDirectory/GADPerson.h>

@interface GADFacStaff : GADPerson
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *departments;
@property (nonatomic, strong) NSString *spouse;

-(GADFacStaff *)init;
-(GADFacStaff *)initWithDictionary: (NSDictionary *) dict;

@end
