#import "GADSearchViewController.h"
#import "GADListViewController.h"
#import "GADDirectory.h"
#import "GADTextTableViewCell.h"
#import "GADNumberTableViewCell.h"

@interface GADSearchViewController ()

@end

@implementation GADSearchViewController {
    NSArray *searchField;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return searchField.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ((indexPath.row == 0) &&
        ([searchField[indexPath.section] isEqualToString:@"Last name"] ||
         [searchField[indexPath.section] isEqualToString:@"First name"] ||
         [searchField[indexPath.section] isEqualToString:@"Campus Address or P.O. Box"] ||
         [searchField[indexPath.section] isEqualToString:@"Computer Username"] ||
         [searchField[indexPath.section] isEqualToString:@"Home Address"])) {

        GADTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        cell.placeholderText = searchField[indexPath.section];
        return cell;
        
    } else if ((indexPath.row == 0) &&
               ([searchField[indexPath.section] isEqualToString:@"Fac/Staff Dept/Office"] ||
                [searchField[indexPath.section] isEqualToString:@"Fac/Staff Dept/Office"] ||
                [searchField[indexPath.section] isEqualToString:@"Student Major"] ||
                [searchField[indexPath.section] isEqualToString:@"Hiatus"] ||
                [searchField[indexPath.section] isEqualToString:@"SGA"] ||
                [searchField[indexPath.section] isEqualToString:@"Concentration"] ||
                [searchField[indexPath.section] isEqualToString:@"Student Class"])) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerCell"];
        cell.textLabel.text = searchField[indexPath.section];
        return cell;
                   
    } else {
        
        GADNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
        cell.placeholderText = searchField[indexPath.section];
        return cell;
        
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSString *segueName = @"showList";
    //NSData *data;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    if ([cell.reuseIdentifier isEqualToString:@"textCell"] ||
        [cell.reuseIdentifier isEqualToString:@"numberCell"]) {
        NSLog(@"##");
    } else {
        [cell.heightAnchor constraintEqualToAnchor:cell.heightAnchor multiplier:5];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    searchField = @[@"Last name", @"First name", @"Campus Address or P.O. Box", @"Fac/Staff Dept/Office", @"Student Major", @"Hiatus",@"Computer Username", @"Campus Phone", @"Home Address", @"SGA", @"Concentration", @"Student Class"];
    
    GADQuery *query = [GADQuery new];
    [query setfirstName:@"Alex"];
    [query setlastName:@"Mitchell"];
    
    //NSDictionary *dict = [query convertQueryObejectToDict];
    //NSLog(@"%@",dict);
    
    [query fetchPersonInfoWithUsername:@"test1stu" Password:@"selfserv1" completionHandler:^void (NSArray<GADPerson *> *people) {
        for (GADPerson *person in people){
            [person printInfo];
        }
    
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
