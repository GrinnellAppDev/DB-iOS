//
//  numberTableViewCell.m
//  DB
//
//  Created by Jianting Chen on 2/13/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import "GADNumberTableViewCell.h"

@implementation GADNumberTableViewCell {
    
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
    self.numberField.attributedPlaceholder =[[NSAttributedString alloc] initWithString: self.placeholderText attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.73 green:0.29 blue:0.29 alpha:1.0]}];
    // Configure the view for the selected state
    
    [self.numberField setKeyboardType:UIKeyboardTypeNumberPad];
}

@end
