#import "GADFacStaff.h"

#import <GADDirectory/GADPerson.h>

@implementation GADFacStaff

-(GADFacStaff *)init{
    if (self = [super init]){
        self.type = FacStaff;
    }
    return self;
}

-(GADFacStaff *)initWithDictionary:(NSDictionary *)dict {
    GADFacStaff *facStaff = [GADFacStaff alloc];
    facStaff.type = FacStaff;
    facStaff.titles = [dict valueForKey:@"titles"];
    facStaff.departments = [dict valueForKey:@"departments"];
    facStaff.spouse = [dict valueForKey:@"spouse"];
    return facStaff;
}

@end
