#import "GADFacStaff.h"

#import <GADDirectory/GADPerson.h>

@implementation GADFacStaff

-(GADFacStaff *)initWithDictionary:(NSDictionary *)dict {
    GADFacStaff *facStaff = [GADFacStaff alloc];
    facStaff.type = FacStaff;
    facStaff.title = @[[dict valueForKey:@"title"], [dict valueForKey:@"title2"], [dict valueForKey:@"title3"], [dict valueForKey:@"title4"], [dict valueForKey:@"title5"], [dict valueForKey:@"title6"], [dict valueForKey:@"title7"], [dict valueForKey:@"title8"]];
    return facStaff;
}

@end
