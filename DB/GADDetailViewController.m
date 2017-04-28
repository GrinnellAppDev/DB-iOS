#import "GADDetailViewController.h"
#import "GADDetailTableViewCell.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADDetailViewController ()

@end

@implementation GADDetailViewController {
    
    __weak IBOutlet UIImageView *profileImage;
    __weak IBOutlet UITextView *nameTextView;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_person.type == Student)
        return 6;
    else if (_person.type == SGA)
        return 9;
    else
        return 9;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GADDetailTableViewCell *cell;
    
    if (_person.type == Student) {
        GADStudent *student = (GADStudent *) _person;
        
    } else if (_person.type == SGA) {
        GADSGA *sga = (GADSGA *) _person;
        
    } else if (_person.type == FacStaff) {
        GADFacStaff *facStaff = (GADFacStaff *) _person;
        
    }
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: _person.imgPath];
    UIImage *image = [UIImage imageWithData:imageData];
    [profileImage setImage:image];
    
    nameTextView.text = [NSString stringWithFormat:@"%@ %@", _person.firstName, _person.lastName];
    
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
