#import "textTableViewCell.h"

@implementation textTableViewCell {
    
    __weak IBOutlet UITextField *textField;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    textField.attributedPlaceholder =[[NSAttributedString alloc] initWithString: self.placeholderText attributes:nil];
    if (self.isSelected ) {
        self.textLabel.textColor = [UIColor whiteColor];
        textField.hidden = false;
        textField.selected = true;
        textField.highlighted = true;
    }

    // Configure the view for the selected state
}

@end
