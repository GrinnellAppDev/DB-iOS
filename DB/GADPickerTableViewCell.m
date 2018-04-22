#import "GADPickerTableViewCell.h"

@implementation GADPickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    // Adjust the left-margin of the textLabel
    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x + 40,
                                      self.textLabel.frame.origin.y,
                                      self.textLabel.frame.size.width,
                                      self.textLabel.frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIView *backView = [[UIView alloc] initWithFrame:self.frame];
    backView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = backView;
    [super setSelected:selected animated:animated];
    self.textLabel.font = [UIFont systemFontOfSize: 18];
}

@end
