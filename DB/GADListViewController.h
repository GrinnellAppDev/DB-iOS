#import <UIKit/UIKit.h>
#import <GADDirectory/GADDirectory.h>

@interface GADListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *searchResult;

@end
