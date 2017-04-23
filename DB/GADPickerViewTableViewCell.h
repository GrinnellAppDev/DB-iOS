#import <UIKit/UIKit.h>

@interface GADPickerViewTableViewCell : UITableViewCell<UIPickerViewDataSource, UIPickerViewDelegate>;

@property (nonatomic, strong) NSArray *options;

@end
