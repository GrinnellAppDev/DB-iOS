#import "GADSearchViewController.h"
#import "GADListViewController.h"
#import "GADDirectory.h"
#import "GADTextTableViewCell.h"
#import "GADNumberTableViewCell.h"
#import "GADPickerTableViewCell.h"
#import "GADPickerViewTableViewCell.h"

@interface GADSearchViewController ()
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;

@end

@implementation GADSearchViewController {
    NSArray *searchField;
    NSArray *major;
    NSMutableArray<NSNumber *> *selected;
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
    if ([selected[section] isEqualToValue:@true]) {
        return 2;
    }
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
        
        GADPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerCell"];         cell.textLabel.text = searchField[indexPath.section];
        return cell;
                   
    } else if (indexPath.row == 1) {
        GADPickerViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pickerViewCell"];
        
        // Create a picker view cell with options according to selected header
        if ([searchField[indexPath.section] isEqualToString:@"Fac/Staff Dept/Office"]) {
            cell.options=department;

        } else if ([searchField[indexPath.section] isEqualToString:@"Student Major"]) {
            cell.options=major;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"Hiatus"]) {
            cell.options=hiatus;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"SGA"]) {
            cell.options=SGA;
            
        } else if ([searchField[indexPath.section] isEqualToString:@"Concentration"]) {
            cell.options=concentration;
            
        } else {
            cell.options=studentClass;
            
        }
        [cell.pickerView reloadAllComponents];
        return cell;
    
    } else {
        
        GADNumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"numberCell"];
        cell.placeholderText = searchField[indexPath.section];
        return cell;
        
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        return 97;
    }
    return 61;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSearchResult"]) {
        GADListViewController *destinationController = (GADListViewController *)segue.destinationViewController;
        NSArray<NSString *> *queryField = @[@"lastName", @"firstName", @"campusAddress", @"facStaffOffice", @"major", @"hiatus", @"userName", @"campusPhone", @"homeAddress", @"sga", @"concentration", @"classYr"];
        NSMutableDictionary *criteria = [[NSMutableDictionary alloc] init];
        for (int i = 0; i < searchField.count; i++) {
            if (![searchField[i] isEqualToString:@"Fac/Staff Dept/Office"] &&
                ![searchField[i] isEqualToString:@"Fac/Staff Dept/Office"] &&
                ![searchField[i] isEqualToString:@"Student Major"] &&
                ![searchField[i] isEqualToString:@"Hiatus"] &&
                ![searchField[i] isEqualToString:@"SGA"] &&
                ![searchField[i] isEqualToString:@"Concentration"] &&
                ![searchField[i] isEqualToString:@"Student Class"]) { //To-do: read input from pickerCell
                if ([searchField[i] isEqualToString:@"Last name"] ||
                    [searchField[i] isEqualToString:@"First name"] ||
                    [searchField[i] isEqualToString:@"Campus Address or P.O. Box"] ||
                    [searchField[i] isEqualToString:@"Computer Username"] ||
                    [searchField[i] isEqualToString:@"Home Address"]) {
                    GADTextTableViewCell *textCell = (GADTextTableViewCell *)[self.searchTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection: i]];
                    if (![textCell.textField.text isEqualToString: @""]) {
                        [criteria setValue: textCell.textField.text forKey:queryField[i]];
                    }
                } else {
                    GADNumberTableViewCell *numberCell = (GADNumberTableViewCell *)[self.searchTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection: i]];
                    if (![numberCell.numberField.text isEqualToString: @""]) {
                        [criteria setValue: numberCell.numberField.text forKey:queryField[i]];
                    }
                }
            }
        }
        
        /*for (int i = 0; i < searchField.count; i++) {
            NSLog(@"##\n%@ is %@\n##\n", queryField[i],[criteria valueForKey:queryField[i]]);
        } //print criterias*/
        
        destinationController.criteria = criteria;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    if ([cell.reuseIdentifier isEqualToString:@"pickerCell"]) {
        if ([selected[indexPath.section] isEqualToValue:@true]) {
            selected[indexPath.section] = @false;
        } else {
            for (int i=0; i<searchField.count; i++) {
                selected[i] = @false;
            } //Close any drop-down cell
            selected[indexPath.section] = @true;
        }
    }
    [tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    searchField = @[@"Last name",
                    @"First name",
                    @"Campus Address or P.O. Box",
                    @"Fac/Staff Dept/Office",
                    @"Student Major",
                    @"Hiatus",
                    @"Computer Username",
                    @"Campus Phone",
                    @"Home Address",
                    @"SGA",
                    @"Concentration",
                    @"Student Class"];
    
    major = @[@"Anthropology",
              @"Art History",
              @"Biological Chemistry",
              @"Biology",
              @"Chemistry",
              @"Chinese",
              @"Classics",
              @"Computer Science",
              @"Economics",
              @"English",
              @"French",
              @"Gender, Women's and Sexuality Studies",
              @"General Science",
              @"German",
              @"History",
              @"Mathematics",
              @"Music",
              @"Philosophy",
              @"Physics",
              @"Political Science",
              @"Psychology",
              @"Religious Studies",
              @"Russian",
              @"Sociology",
              @"Spanish",
              @"Studio Art",
              @"Theatre and Dance"];
    
    department = @[@"Academic Advising",
                   @"Academic Affairs and Dean of the College",
                   @"Accessibility and Disability Services",
                   @"Accounting",
                   @"Admission",
                   @"Analytic Support and Institutional Research",
                   @"Auxiliary Services and Economic Development",
                   @"Benefits and Insurance",
                   @"Black Cultural Center",
                   @"Bookstore (Pioneer Bookshop)",
                   @"Campus Safety",
                   @"Cashier",
                   @"Catering",
                   @"Center for Careers, Life, and Service",
                   @"Center for Religion, Spirituality, and Social Justice",
                   @"Communications",
                   @"Community Enhancement and Engagement",
                   @"Conference Operations and Events",
                   @"Corporate, Foundation, and Government Relations",
                   @"Development and Alumni Relations",
                   @"Dining",
                   @"Disability Resources",
                   @"Diversity and Inclusion",
                   @"Environmental Stewardship",
                   @"Facilities Management",
                   @"Faulconer Gallery",
                   @"Financial Aid",
                   @"Grinnell Prize",
                   @"Human Resources",
                   @"Information Technology Services",
                   @"Institutional Planning and Budget Planning",
                   @"Intercultural Affairs",
                   @"International Student Affairs",
                   @"Investment Office",
                   @"Libraries",
                   @"Mail Services",
                   @"New Student Orientation",
                   @"Off-Campus Study",
                   @"Ombuds",
                   @"Pioneer Bookshop",
                   @"President",
                   @"Registrar",
                   @"Research Ethics",
                   @"Residence Life",
                   @"Service and Social Innovation",
                   @"Stonewall Resource Center",
                   @"Strategic Planning",
                   @"Student Affairs",
                   @"Student Assistance",
                   @"Student Health and Counseling Services",
                   @"Treasurer",
                   @"Wellness"];
    
    SGA = @[@"President",
            @"Vice President of Academic Affairs",
            @"Vice President of Student Affairs",
            @"Administrative Coordinator",
            @"Treasurer",
            @"Assistant Treasurer",
            @"All Campus Events Co-Chair",
            @"Services Coordinator",
            @"Diversity and Outreach Coordinator",
            @"Concerts Chair",
            @"Senator",
            @"Class Ambassador",
            @"Presiding Officer",
            @"Technical Advisor"];
    
    concentration = @[@"American Studies",
                      @"East Asian Studies",
                      @"Environmental Studies",
                      @"European Studies",
                      @"Global Development Studies",
                      @"Latin American Studies",
                      @"Linguistics",
                      @"Neuroscience",
                      @"Peace and Conflict Studies",
                      @"Physical Education",
                      @"Policy Studies",
                      @"Russian, Central, and Eastern European Studies",
                      @"Statistics",
                      @"Technology Studies"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    
    studentClass = @[yearString,
                     @2019,
                     @2020,
                     @2021,
                     @2022];
    
    hiatus = @[@"Grinnell in London", @"Grinnell in Washington"];
    selected = [[NSMutableArray alloc] initWithCapacity:searchField.count];
    for (int i=0; i<searchField.count; i++) {
        selected[i] = @false;
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
