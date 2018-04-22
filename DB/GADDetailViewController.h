#import <UIKit/UIKit.h>
#import <GADDirectory/GADDirectory.h>
#import <MessageUI/MessageUI.h>
#import "GADPerson.h"

@interface GADDetailViewController : UIViewController <MFMailComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
- (IBAction)sendEmail:(id)sender;
@property (nonatomic, strong) GADPerson *person;
@property (strong, nonatomic) NSArray *labels;
@property (strong, nonatomic) NSArray *attributes;
@end
