#import <UIKit/UIKit.h>
#import <GADDirectory/GADDirectory.h>
#import "GADPerson.h"

@interface GADListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *searchResult;
@property (nonatomic, strong) NSDictionary *criteria;

@end
