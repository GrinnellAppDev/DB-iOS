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
    if ([searchField[indexPath.row] isEqualToString:@"Last name"] ||
        [searchField[indexPath.row] isEqualToString:@"First name"] ||
        [searchField[indexPath.row] isEqualToString:@"Campus Address or P.O. Box"] ||
        [searchField[indexPath.row] isEqualToString:@"Computer Username"] ||
        [searchField[indexPath.row] isEqualToString:@"Home Address"]) {

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        cell.textLabel.text = searchField[indexPath.row];
        return cell;
        
    } else if ([searchField[indexPath.row] isEqualToString:@"Fac/Staff Dept/Office"] ||
               [searchField[indexPath.row] isEqualToString:@"Fac/Staff Dept/Office"] ||
               [searchField[indexPath.row] isEqualToString:@"Student Major"] ||
               [searchField[indexPath.row] isEqualToString:@"Hiatus"] ||
               [searchField[indexPath.row] isEqualToString:@"SGA"] ||
               [searchField[indexPath.row] isEqualToString:@"Concentration"] ||
               [searchField[indexPath.row] isEqualToString:@"Student Class"]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerCell"];
        cell.textLabel.text = searchField[indexPath.row];
        return cell;
        
    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
        cell.textLabel.text = searchField[indexPath.row];
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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
