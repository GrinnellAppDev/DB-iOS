//
//  GADPickerTableViewCell.h
//  DB
//
//  Created by Jianting Chen on 2/20/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GADPickerTableViewCell : UITableViewCell<UIPickerViewDataSource, UIPickerViewDelegate>;

@property (nonatomic, strong) NSArray *options;

@end
