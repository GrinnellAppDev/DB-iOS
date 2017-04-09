
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

-(NSDictionary*) dictionaryRepresentation;

-(void) executeWithUsername:(nonnull NSString*)username
                   Password:(nonnull NSString*) password
          completionHandler:(void(^_Nonnull)(NSArray<GADPerson *> *))completion;

@end
