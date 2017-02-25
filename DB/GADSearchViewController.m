#import "GADSearchViewController.h"
#import "GADListViewController.h"
#import "GADDirectory.h"
#import "GADTextTableViewCell.h"
#import "GADNumberTableViewCell.h"
#import "GADPickerTableViewCell.h"

@interface GADSearchViewController ()

@end

@implementation GADSearchViewController {
    NSArray *searchField;
    NSArray *major;
    NSMutableArray *selected;
    NSArray *department;
    NSArray *SGA;
    NSArray *concentration;
    NSArray *studentClass;
    NSArray *hiatus;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return searchField.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (selected[section]) return 2;
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
                [searchField[indexPath.section] isEqualToString:@"Student Major"] ||
                [searchField[indexPath.section] isEqualToString:@"Hiatus"] ||
                [searchField[indexPath.section] isEqualToString:@"SGA"] ||
                [searchField[indexPath.section] isEqualToString:@"Concentration"] ||
                [searchField[indexPath.section] isEqualToString:@"Student Class"])) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerCell"];
        cell.textLabel.text = searchField[indexPath.section];
        return cell;
                   
    } else if (indexPath.row == 1) {
        
        // Create a picker view cell with options according to selected header
        if ([searchField[indexPath.section] isEqualToString:@"Fac/Staff Dept/Office"]) {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=department;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"Student Major"]) {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=major;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"Hiatus"]) {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=hiatus;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"SGA"]) {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=SGA;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"Concentration"]) {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=concentration;
            
        } else {
            GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
            cell.options=studentClass;
            
        }
    
    } else {
        
        GADNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
        cell.placeholderText = searchField[indexPath.section];
        return cell;
        
    }
    return 0;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSString *segueName = @"showList";
    //NSData *data;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.reuseIdentifier isEqualToString:@"pickerCell"]) {
        if ([selected[indexPath.section] isEqualToValue:@true]) { // This condition is never met...
            selected[indexPath.section] = @false;
        } else {
            NSLog(@"%@", selected[indexPath.section]); // Always reports (null)
            selected[indexPath.section] = @true;
        }
    } else {
        NSLog(@"");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *selected = [[NSMutableArray alloc] init];
    for (int i=0; i<searchField.count; i++) {
        selected[i] = @false; // We need to initialize to all false values at start, but it is not working.
    }
    searchField = @[@"Last name", @"First name", @"Campus Address or P.O. Box", @"Fac/Staff Dept/Office", @"Student Major", @"Hiatus",@"Computer Username", @"Campus Phone", @"Home Address", @"SGA", @"Concentration", @"Student Class"];
    major = @[@"Math", @"Computer Science"];
    department = @[@"Accounting", @"Admission"];
    SGA = @[@"President",@"Treasurer"];
    concentration = @[@"American Studies", @"Environmental Studies"];
    studentClass = @[@"2017", @"2018", @"2019", @"2020"];
    hiatus = @[@"Grinnell in London", @"Grinnell in Washington"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
