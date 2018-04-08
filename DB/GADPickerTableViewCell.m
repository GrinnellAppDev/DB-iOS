#import "GADPickerTableViewCell.h"

@implementation GADPickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIView *backView = [[UIView alloc] initWithFrame:self.frame];
    backView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = backView;
    [super setSelected:selected animated:animated];
    self.textLabel.font = [UIFont systemFontOfSize: 18];
    self.textLabel.frame = CGRectMake(58, 0, 375, 61);
}

@end
