//
//  GADListViewController.h
//  DB
//
//  Created by AppDev on 10/23/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADDirectory.h"

@interface GADListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) GADDirectory *directory;

@end
