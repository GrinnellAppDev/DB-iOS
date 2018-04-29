#import "GADSGA.h"

@implementation GADSGA

-(GADSGA *)init{
    if (self = [super init]){
        self.type = SGA;
    }
    return self;
}

-(GADSGA *)initWithDictionary:(NSDictionary *)dict {
    GADSGA *sga = [GADSGA alloc];
    sga.type = SGA;
    sga.office_phone = [dict valueForKey:@"office_phone"];
    sga.office_email = [dict valueForKey:@"office_email"];
    sga.office_addr = [dict valueForKey:@"office_addr"];
    sga.office_box = [dict valueForKey:@"office_box"];
    sga.position_name = [dict valueForKey:@"position_name"];
    sga.office_hours = [dict valueForKey:@"office_hours"];
    return sga;
}

@end
