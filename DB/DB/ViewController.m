//
//  ViewController.m
//  DB
//
//  Created by AppDev on 10/1/16.
//  Copyright © 2016 AppDev. All rights reserved.
//

#import "ViewController.h"
#import "GADListViewController.h"
#import "GADDirectory.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *searchField;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return searchField.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = searchField[indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueName = @"showList";
    NSData *data;
    GADDirectory *directory;
    if ([segue.identifier isEqualToString:segueName]) {
        GADListViewController *dest = (GADListViewController *)segue.destinationViewController;
        dest.directory = [directory initWithData: data];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    searchField = @[@"Last name", @"First name", @"Campus Address or P.O. Box", @"Fac/Staff Dept/Office", @"Student Major", @"Hiatus",@"Computer Username", @"Campus Phone", @"Home Address", @"SGA", @"Concentration", @"Student Class"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
