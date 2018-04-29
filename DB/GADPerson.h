#import <Foundation/Foundation.h>

typedef enum {Student, FacStaff, SGA} GADPersonType;

@interface GADPerson : NSObject

@property (nonatomic) GADPersonType type;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *box;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSURL *imgPath;
@property (nonatomic, strong) NSString *personType;
@property (nonatomic, strong) NSString *homeAddress;

-(GADPerson *)initWithDictionary: (NSDictionary *) dict;

/*!
 @brief This method returns an array of people, including a student, a faculty and a SGA.
 */
+(NSArray <GADPerson*>*)dummyPeople;

/*!
 @brief This method is for back-end to use.
 */
-(void)printInfo;



@end
