#import <UIKit/UIKit.h>

@interface GADPickerViewTableViewCell : UITableViewCell<UIPickerViewDataSource, UIPickerViewDelegate>;

@property (nonatomic, strong) NSArray *options;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
