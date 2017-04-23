#import <UIKit/UIKit.h>

@interface GADPickerTableViewCell : UITableViewCell<UIPickerViewDataSource, UIPickerViewDelegate>;

@property (nonatomic, strong) NSArray *options;

@end
