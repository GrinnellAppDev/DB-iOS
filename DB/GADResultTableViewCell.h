//
//  GADResultTableViewCell.h
//  DB
//
//  Created by AppDev Developer on 3/12/17.
//  Copyright © 2017 AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADPerson.h"

@interface GADResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *resultText;
@property (strong, nonatomic) GADPerson *person;

@end
