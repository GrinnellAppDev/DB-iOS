#import <Foundation/Foundation.h>
#import "GADPerson.h"

@interface GADQuery : NSObject

@property (nullable,nonatomic, strong) NSString *lastName;
@property (nullable,nonatomic, strong) NSString *firstName;
@property (nullable,nonatomic, strong) NSString *userName;
@property (nullable,nonatomic, strong) NSString *campusPhone;
@property (nullable,nonatomic, strong) NSString *campusAddress;
@property (nullable,nonatomic, strong) NSString *homeAddress;
@property (nullable,nonatomic, strong) NSString *classYr;
@property (nullable,nonatomic, strong) NSString *facStaffOffice;
@property (nullable,nonatomic, strong) NSString *major;
@property (nullable,nonatomic, strong) NSString *concentration;
@property (nullable,nonatomic, strong) NSString *sga;
@property (nullable,nonatomic, strong) NSString *hiatus;

/*!
 @brief This method takes in a GADQuery containing criteria and returns an array of GADPerson which fulfill the criteria. Username and Password required.
 @discussion To use the completion handler:
 
 @code
 completionHandler:^void(NSArray<GADPerson *> * people,NSError *error){
 //DO WHATEVER YOU WANT WITH people HERE!!!!!!!!!!
 }
 @endcode
 
 Inside the completion handler, there's a GADPerson Array called people (you can name it whatever you want actually), containing the results the url returns for you to use.
 */
-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*) password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> * _Nullable people,NSError * _Nullable error))completion;

@end
