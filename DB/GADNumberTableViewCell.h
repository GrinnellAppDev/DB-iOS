#import <UIKit/UIKit.h>

@interface GADNumberTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *placeholderText;
@property (weak, nonatomic) IBOutlet UITextField *numberField;

@end
