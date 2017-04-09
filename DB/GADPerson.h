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

/*!
 @brief This method returns an array of people, including a student, a faculty and a SGA.
 */
+(NSArray <GADPerson*>*)dummyPeople;

/*!
 @brief This method takes in a NSDictionary containing criteria and returns an array of GADPerson which fulfill the criteria. Username and Password required.
 @discussion In order to use this method, use the template
 
 @code
    [GADPerson fetchPersonInfoWithCriteria:@{@"lastName":@"Chen",@"firstName":@"Ziwen"} 
                                  Username:@"test1stu" 
                                  Password:@"selfserv1"
                         completionHandler:^void(NSArray<GADPerson *> * people){
                         //DO WHATEVER YOU WANT WITH people HERE!!!!!!!!!!
                         }];
 @endcode
 
 This code snippet will fetch all people whose lastname is Chen and firstname is Ziwen.
 
 Inside the completion handler, there's a GADPerson Array called people (you can name it whatever you want actually), containing the results the url returns for you to use.
 */
+(void) executeWithDict:(NSDictionary*)criteria
               Username:(NSString*)username
               Password:(NSString*)password
      completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion;

/*!
 @brief This method is for back-end to use.
 */
-(void)printInfo;



@end
