#import <UIKit/UIKit.h>
#import "GADPickerTableViewCell.h"

@interface GADPickerViewTableViewCell : UITableViewCell<UIPickerViewDataSource, UIPickerViewDelegate>;

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) GADPickerTableViewCell *parent;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
