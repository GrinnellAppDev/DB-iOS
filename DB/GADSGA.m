#import "GADSGA.h"

@implementation GADSGA

-(GADSGA *)initWithDictionary:(NSDictionary *)dict {
    GADSGA *sga = [GADSGA alloc];
    sga.type = SGA;
    sga.office_phone = [dict valueForKey:@"office_phone"];
    sga.office_email = [dict valueForKey:@"office_email"];
    sga.office_box = [dict valueForKey:@"office_box"];
    sga.office_hours = @[[dict valueForKey:@"office_hours_1"], [dict valueForKey:@"office_hours_2"], [dict valueForKey:@"office_hours_3"], [dict valueForKey:@"office_hours_4"]];
    return sga;
}

@end
