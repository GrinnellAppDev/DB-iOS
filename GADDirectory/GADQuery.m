#import "GADQuery.h"

static const NSString *apiURL = @"https://appdev.grinnell.edu/api/db/v1/list";
const NSTimeInterval timeoutInterval = 60.0;

@implementation GADQuery

-(NSDictionary*) dictionaryRepresentation {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (self.lastName) [dict setValue:self.lastName forKey:@"lastName"];
    if (self.firstName) [dict setValue:self.firstName forKey:@"firstName"];
    if (self.userName) [dict setValue:self.userName forKey:@"userName"];

    if (self.campusPhone) [dict setValue:self.campusPhone forKey:@"campusPhone"];
    if (self.campusAddress) [dict setValue:self.campusAddress forKey:@"campusAddress"];
    if (self.homeAddress) [dict setValue:self.homeAddress forKey:@"homeAddress"];

    if (self.classYr)[dict setValue:self.classYr forKey:@"classYr"];

    if (self.facStaffOffice) [dict setValue:self.facStaffOffice forKey:@"facStaffOffice"];
    
    if (self.major) [dict setValue:self.major forKey:@"major"];
    if (self.concentration) [dict setValue:self.concentration forKey:@"concentration"];

    if (self.sga) [dict setValue:self.sga forKey:@"sga"];
    if (self.hiatus) [dict setValue:self.hiatus forKey:@"hiatus"];
    return dict;
}

-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*)password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *people,NSError *error))completion {
    NSDictionary *dict = [self dictionaryRepresentation];
    [GADQuery executeWithDict:dict Username:username Password:password completionHandler:completion];
}

+ (void) executeWithDict:(NSDictionary*)criteria
                Username:(NSString*)username
                Password:(NSString*)password
       completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *people,NSError *error))completion {
    
    NSMutableArray *queryItems = [NSMutableArray<NSURLQueryItem *> new];
    for (NSString *key in criteria){
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:criteria[key]]];
    }
    NSURLComponents *components = [NSURLComponents componentsWithString:apiURL];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    
    /* old authentication scheme
    NSString *authenticationString = [NSString stringWithFormat:@"{'un':'%@', 'pw':'%@'}",username,password];
    NSData *bodyData = [authenticationString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *bodyLength = [NSString stringWithFormat:@"%lu",(unsigned long)[bodyData length]];
    */
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:timeoutInterval];
    [req setHTTPMethod:@"GET"];
    //[req setValue:bodyLength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"application/json" forHTTPHeaderField: @"Content-Type"];
    //[req setHTTPBody:bodyData];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil,error);
            return;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse statusCode] != 200) {
            NSDictionary *errorDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONParsingError];
            NSDictionary *userInfo =
  @{
    NSLocalizedDescriptionKey: NSLocalizedString(@"Search unsuccessful.", nil),
    NSLocalizedFailureReasonErrorKey: NSLocalizedString([errorDict valueForKey:@"message"], nil),
    NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"", nil)
    };
             NSError *searchError = [NSError errorWithDomain:@""
                                                 code:0
                                             userInfo:userInfo];
            completion(nil,searchError);
            return;
        }
        NSMutableArray <GADPerson*> *result=[NSMutableArray<GADPerson*> new];
        NSError *JSONParsingError;
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONParsingError];
        
        for (NSDictionary *entry in arr){
            GADPerson *person = [[GADPerson alloc] initWithDictionary:entry];
            [result addObject:person];
        }
        completion(result,nil);
    }];
    [task resume];
}

@end
