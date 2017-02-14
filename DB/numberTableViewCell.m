//
//  numberTableViewCell.m
//  DB
//
//  Created by Jianting Chen on 2/13/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import "numberTableViewCell.h"

@implementation numberTableViewCell {
    
    __weak IBOutlet UITextField *numberField;
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
    numberField.attributedPlaceholder =[[NSAttributedString alloc] initWithString: self.placeholderText attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:0.73 green:0.29 blue:0.29 alpha:1.0]}];
    // Configure the view for the selected state
    
    [numberField setKeyboardType:UIKeyboardTypeNumberPad];
}

@end