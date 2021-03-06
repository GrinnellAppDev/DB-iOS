#import "GADDetailViewController.h"
#import "GADDetailTableViewCell.h"
#import "GADProfileImageTableViewCell.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GADDetailViewController {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return number of cells per person type, and fill corresponding arrays for labels and attributes
    if (_person.type == Student) {
        GADStudent *student = (GADStudent *) _person;
        _labels = @[@"Major", @"Class", @"Email", @"Campus Box", @"Campus Address"];
        _attributes = @[student.major, student.classYear, student.email, student.box, student.address];
        return 7;
        
    } else if (_person.type == SGA) {
        GADSGA *sga = (GADSGA *) _person;
        NSString *officeHours = [sga.office_hours componentsJoinedByString: @"\n"];
        _labels = @[@"SGA Position", @"Office Email", @"Office Hours", @"Major", @"Class", @"Email", @"Campus Box", @"Campus Address"];
        _attributes = @[sga.position_name, sga.office_email, officeHours, sga.major, sga.classYear, sga.email, sga.box, sga.address];
        return 10;
        
    } else {
        GADFacStaff *facstaff = (GADFacStaff *) _person;
        NSString *titles = [facstaff.titles componentsJoinedByString: @"\n"];
        NSString *departments = [facstaff.departments componentsJoinedByString: @"\n"];
        _labels = @[@"Titles", @"Departments", @"Campus Phone", @"Email", @"Campus Address", @"Campus Box"];
        _attributes = @[titles, departments, facstaff.phone, facstaff.email, facstaff.address, facstaff.box];
        return 8;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Profile image cell
    if (indexPath.row == 0) {
        
        // Add the profile image to its cell
        GADProfileImageTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"profileImageCell"];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: _person.imgPath];
        cell.profileImage.image = [UIImage imageWithData:imageData];
        cell.profileImage.frame = CGRectMake(0, 0, 104, 146);
        cell.profileImage.center = CGPointMake(cell.center.x, cell.profileImage.center.y);
        
        // Workaround to hide separator line
        cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0);
        return cell;
        
    // Name cell
    } else if (indexPath.row == 1) {
        
        // Set the text for the name cell
        UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"nameTextCell"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", _person.firstName, _person.lastName];
        
        // Align text to center
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell;
        
    // Titles cell for FacStaff
    } else if (_person.type == FacStaff && indexPath.row  == 2) {
        GADDetailTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
        
        if (!([_attributes[indexPath.row - 2]  isEqual: @" "])) {
            cell.textLabel.text = _labels[indexPath.row - 2];
            cell.detailTextLabel.text = _attributes[indexPath.row - 2];
            GADFacStaff *facstaff = (GADFacStaff *) _person;
            cell.detailTextLabel.numberOfLines = [facstaff.titles count];
            cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        }
        return cell;
        
    // Departments cell for FacStaff
    } else if (_person.type == FacStaff && indexPath.row  == 3) {
        GADDetailTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
        
        if (!([_attributes[indexPath.row - 2]  isEqual: @" "])) {
            cell.textLabel.text = _labels[indexPath.row - 2];
            cell.detailTextLabel.text = _attributes[indexPath.row - 2];
            GADFacStaff *facstaff = (GADFacStaff *) _person;
            cell.detailTextLabel.numberOfLines = [facstaff.departments count];
            cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        }
        return cell;
        
    // Office-hours cell for SGA
    } else if (_person.type == SGA && indexPath.row  == 4) {
        GADDetailTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
        if (!([_attributes[indexPath.row - 2]  isEqual: @" "])) {
            cell.textLabel.text = _labels[indexPath.row - 2];
            cell.detailTextLabel.text = _attributes[indexPath.row - 2];
            GADSGA *sga = (GADSGA *) _person;
            cell.detailTextLabel.numberOfLines = [sga.office_hours count];
            cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        }
        return cell;
        
    } else {
        // Set the appropriate attribute
        GADDetailTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
        
        // Values that don't exist are entered as a space
        if (!([_attributes[indexPath.row - 2]  isEqual: @" "])) {
            // Set the text of the textlabels
            cell.textLabel.text = _labels[indexPath.row - 2];
            cell.detailTextLabel.text = _attributes[indexPath.row - 2];
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 162;
    } else if (_person.type == SGA && indexPath.row  == 4) {
            GADSGA *sga = (GADSGA *) _person;
            return (30 * [sga.office_hours count]) + 30;
    } else if (_person.type == FacStaff && indexPath.row == 2) {
            GADFacStaff *facstaff = (GADFacStaff *) _person;
            return (30 * [facstaff.titles count]) + 30;
    } else if (_person.type == FacStaff && indexPath.row == 3) {
            GADFacStaff *facstaff = (GADFacStaff *) _person;
            return (30 * [facstaff.departments count]) + 30;
    }
    
    return 60;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.82 green:0.22 blue:0.22 alpha:1.0];

    dispatch_async(dispatch_get_main_queue(),^(void){
        [_tableView reloadData];});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendEmail:(id)sender {
    //subject, body, address.
    NSString *subject = @"";
    // Email Content
    NSString *body = @"";
    // To address
    NSArray *recipent = [NSArray arrayWithObject:_person.email];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setMessageBody:body isHTML:NO];
    [mc setToRecipients:recipent];
    
    // show mail interface
    [self presentViewController:mc animated:YES completion:nil];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // close mail interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
