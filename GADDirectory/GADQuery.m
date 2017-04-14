#import "GADQuery.h"

static const NSString *apiURL = @"https://itwebappstest.grinnell.edu/DotNet/WebServices/api/db";
const NSTimeInterval timeoutInterval = 60.0;

@implementation GADQuery

-(NSDictionary*) dictionaryRepresentation {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (self.lastName) [dict setValue:self.lastName forKey:@"lastName"];
    if (self.firstName) [dict setValue:self.firstName forKey:@"firstName"];
    if (self.campusAddressOrPOBox) [dict setValue:self.campusAddressOrPOBox forKey:@"box"];
    if (self.FacStaffDeptOffice) [dict setValue:self.FacStaffDeptOffice forKey:@"titkle5"];
    if (self.studentMajor) [dict setValue:self.studentMajor forKey:@"major"];
    if (self.hiatus) [dict setValue:self.hiatus forKey:@"hiatus"];
    if (self.computerUsername) [dict setValue:self.computerUsername forKey:@"userName"];
    if (self.campusPhone) [dict setValue:self.campusPhone forKey:@"office_phone"];
    if (self.homeAddress) [dict setValue:self.homeAddress forKey:@"adrees"];
    if (self.SGA) [dict setValue:self.SGA forKey:@"title"];
    if (self.concentration) [dict setValue:self.concentration forKey:@"minor"];
    if (self.studentClass)[dict setValue:self.studentClass forKey:@"classYear"];
    return dict;
}

-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*)password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion {
    NSDictionary *dict = [self dictionaryRepresentation];
    [GADQuery executeWithDict:dict Username:username Password:password completionHandler:completion];
}

+ (void) executeWithDict:(NSDictionary*)criteria
                Username:(NSString*)username
                Password:(NSString*)password
       completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion {
    
    NSMutableArray *queryItems = [NSMutableArray<NSURLQueryItem *> new];
    for (NSString *key in criteria){
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:criteria[key]]];
    }
    NSURLComponents *components = [NSURLComponents componentsWithString:apiURL];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    
    NSString *authenticationString = [NSString stringWithFormat:@"{'un':'%@', 'pw':'%@'}",username,password];
    NSData *bodyData = [authenticationString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *bodyLength = [NSString stringWithFormat:@"%lu",(unsigned long)[bodyData length]];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:timeoutInterval];
    [req setHTTPMethod:@"POST"];
    [req setValue:bodyLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/json" forHTTPHeaderField: @"Content-Type"];
    [req setHTTPBody:bodyData];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"EEERRRRORRRRR");
            return;
        }
        NSMutableArray <GADPerson*> *people=[NSMutableArray<GADPerson*> new];
        NSError *JSONParsingError;
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONParsingError];
        
        for (NSDictionary *entry in arr){
            GADPerson *person = [[GADPerson alloc] initWithDictionary:entry];
            [people addObject:person];
        }
        completion(people);
    }];
    [task resume];
}

@end
