#import <GADDirectory/GADPerson.h>

@interface GADFacStaff : GADPerson
@property (nonatomic, strong) NSArray *title; //title, title2, ... title8. title5 correspond to Department(s).

-(GADFacStaff *)init;
-(GADFacStaff *)initWithDictionary: (NSDictionary *) dict;

@end
