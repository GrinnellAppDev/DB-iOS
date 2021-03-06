#import "GADTextTableViewCell.h"

@implementation GADTextTableViewCell {
    
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
    self.textField.attributedPlaceholder =[[NSAttributedString alloc] initWithString: self.placeholderText attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    if (self.isSelected) {
        self.textField.hidden = false;
        self.textField.highlighted = true;
        if (!self.textField.isFirstResponder) {
            [self.textField becomeFirstResponder];
        }
    }
    
    // Configure the view for the selected state
}


@end
