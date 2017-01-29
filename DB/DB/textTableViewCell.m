//
//  textTableViewCell.m
//  DB
//
//  Created by AppDev on 11/26/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

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
    if (self.isSelected) {
        self.textLabel.textColor = [UIColor whiteColor];
        textField.hidden = false;
        textField.selected = true;
    }

    // Configure the view for the selected state
}

@end
