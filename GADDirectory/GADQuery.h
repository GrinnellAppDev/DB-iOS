#import <Foundation/Foundation.h>
#import "GADPerson.h"

@interface GADQuery : NSObject

@property (nullable,nonatomic, strong) NSString *lastName;
@property (nullable,nonatomic, strong) NSString *firstName;
@property (nullable,nonatomic, strong) NSString *campusAddressOrPOBox;
@property (nullable,nonatomic, strong) NSString *FacStaffDeptOffice;
@property (nullable,nonatomic, strong) NSString *studentMajor;
@property (nullable,nonatomic, strong) NSString *hiatus;
@property (nullable,nonatomic, strong) NSString *computerUsername;
@property (nullable,nonatomic, strong) NSString *campusPhone;
@property (nullable,nonatomic, strong) NSString *homeAddress;
@property (nullable,nonatomic, strong) NSString *SGA;
@property (nullable,nonatomic, strong) NSString *concentration;
@property (nullable,nonatomic, strong) NSString *studentClass;

/*!
 @brief This method takes in a GADQuery containing criteria and returns an array of GADPerson which fulfill the criteria. Username and Password required.
 @discussion To use the completion handler:
 
 @code
 completionHandler:^void(NSArray<GADPerson *> * people){
 //DO WHATEVER YOU WANT WITH people HERE!!!!!!!!!!
 }
 @endcode
 
 Inside the completion handler, there's a GADPerson Array called people (you can name it whatever you want actually), containing the results the url returns for you to use.
 */
-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*) password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *people,NSError *error))completion;

@end
