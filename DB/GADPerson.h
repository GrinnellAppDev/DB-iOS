#import <Foundation/Foundation.h>

typedef enum {Student, FacStaff, SGA} GADPersonType;



@interface GADPerson : NSObject

@property (nonatomic) GADPersonType type;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *reunionYear;
@property (nonatomic, strong) NSString *box;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *address; //on-campus address
@property (nonatomic, strong) NSArray *offCampusAddress; //address1, address2, address3, address4
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *homePhone;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *bldg;
@property (nonatomic, strong) NSString *room;
@property (nonatomic, strong) NSString *spouse;
@property (nonatomic, strong) NSString *alienstatus;
@property (nonatomic, strong) NSURL *imgPath;
@property (nonatomic, strong) NSString *personType;
@property (nonatomic, strong) NSString *deptMajorClass;

-(GADPerson *)initWithDictionary: (NSDictionary *) dict;

+(NSArray <GADPerson*>*)dummyPeople; // returns an array of people, including student, faculty and SGA

+ (void) fetchPersonInfoWithCriteria:(NSDictionary*)crit andUsername:(NSString*)usrname andPassword:(NSString*) pw completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion; // This is important!!!!!!!!
/*
In order to use the method above, use the template
 
 [GADPerson fetchPersonInfoWithCriteria:@{@"lastName":@"Chen",@"firstName":@"Ziwen"} andUsername:@"test1stu" andPassword:@"selfserv1" completionHandler:^void(NSArray<GADPerson *> * people){
 
 //DO WHATEVER YOU WANT WITH people HERE!!!!!!!!!!
 
 }];
 
 This will return all people whose lastname is Chen and firstname is Ziwen.
 
 Inside the completion handler, there's a GADPerson Array called people, containing the results the url returns for you to use.
 
 */

-(void)printInfo; // for back-end to use



@end
