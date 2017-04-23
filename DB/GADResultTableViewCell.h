#import <UIKit/UIKit.h>
#import "GADPerson.h"

@interface GADResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *resultText;
@property (strong, nonatomic) GADPerson *person;

@end
