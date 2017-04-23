#import <UIKit/UIKit.h>

@interface GADTextTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *placeholderText;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end
