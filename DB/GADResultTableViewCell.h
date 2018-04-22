#import <UIKit/UIKit.h>
#import "GADPerson.h"

@interface GADResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextView *resultText;
@property (weak, nonatomic) IBOutlet UITextView *nameText;
@property (strong, nonatomic) GADPerson *person;

@end
