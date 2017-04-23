#import <UIKit/UIKit.h>
#import <GADDirectory/GADDirectory.h>
#import <MessageUI/MessageUI.h>
#import "GADPerson.h"


@interface GADDetailViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)sendEmail:(id)sender;
@property (nonatomic, strong) GADPerson *person;
@end
