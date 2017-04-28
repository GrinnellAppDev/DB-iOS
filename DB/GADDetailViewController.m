#import "GADDetailViewController.h"
#import "GADDetailTableViewCell.h"
#import "GADDetailNameTableViewCell.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GADDetailViewController {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_person.type == Student) {
        GADStudent *student = (GADStudent *) _person;
        _labels = @[@"Major", @"Class", @"Email", @"Campus Box", @"Campus Address"];
        _attributes = @[student.major, student.classYear, student.email, student.box, student.address];
        return 8;
    } else if (_person.type == SGA) {
        GADSGA *sga = (GADSGA *) _person;
        NSString *officeHours = [NSString stringWithFormat: @"%@, %@, %@, %@", sga.office_hours[0], sga.office_hours[1], sga.office_hours[2], sga.office_hours[3]];
        _labels = @[@"SGA Position", @"Office Email", @"Office Hours", @"Major", @"Class", @"Email", @"Campus Box", @"Campus Address"];
        _attributes = @[@"Need backend to make attribute", sga.office_email, officeHours, sga.major, sga.classYear, sga.email, sga.box, sga.address];
        return 12;
    } else {
        GADFacStaff *facstaff = (GADFacStaff *) _person;
        _labels = @[@"Title", @"Department", @"Campus Phone", @"Email", @"Campus Address", @"Campus Box"];
        _attributes = @[facstaff.title[0], facstaff.title[5], facstaff.phone, facstaff.email, facstaff.address, facstaff.box];
        return 9;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /**NSInteger numberOfRows = [tableView numberOfRowsInSection:[indexPath section]];**/
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    /**if (indexPath.row == 0) {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"profileImageCell"];
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: _person.imgPath];
        UIImage *image = [UIImage imageWithData:imageData];
        [cell.imageView setImage:image];
    } else if (indexPath.row == 1) {
        cell = (GADDetailNameTableViewCell *) [_tableView dequeueReusableCellWithIdentifier:@"nameTextCell"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", _person.firstName, _person.lastName];
    } else if (indexPath.row >= 2 && indexPath.row < numberOfRows - 1) {
        cell = (GADDetailTableViewCell *) [_tableView dequeueReusableCellWithIdentifier:@"attributeCell"];
    } else {
        cell = [_tableView dequeueReusableCellWithIdentifier:@"buttonCell"];
    } **/
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: _person.imgPath];
    UIImage *image = [UIImage imageWithData:imageData];
    [_profileImage setImage:image];
    
    _nameText.text = [NSString stringWithFormat:@"%@ %@", _person.firstName, _person.lastName];
    
    dispatch_async(dispatch_get_main_queue(),^(void){
        [self.tableView reloadData];});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendEmail:(id)sender {
    //subject, body, address.
    NSString *subject = @"Test";
    // Email Content
    NSString *body = @"test test test";
    // To address
    NSArray *recipent = [NSArray arrayWithObject:@"chenjian@grinnell.edu"];
    NSLog(@"Creating email");
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setMessageBody:body isHTML:NO];
    [mc setToRecipients:recipent];
    NSLog(@"Before showing email");
    
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
