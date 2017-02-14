#import "textTableViewCell.h"

@implementation textTableViewCell {
    
    __weak IBOutlet UITextField *textField;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    UIView *backView = [[UIView alloc] initWithFrame:self.frame];
    backView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = backView;
    
    [super setSelected:selected animated:animated];
    textField.attributedPlaceholder =[[NSAttributedString alloc] initWithString: self.placeholderText attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.73 green:0.29 blue:0.29 alpha:1.0]}];
    if (self.isSelected) {
        textField.hidden = false;
        textField.highlighted = true;
        if (!textField.isFirstResponder) {
            [textField becomeFirstResponder];
        }
    }

    // Configure the view for the selected state
}

@end
