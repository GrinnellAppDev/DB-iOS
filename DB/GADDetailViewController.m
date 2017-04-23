#import "GADDetailViewController.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADDetailViewController ()

@end

@implementation GADDetailViewController {
    
    __weak IBOutlet UIImageView *profileImage;
    __weak IBOutlet UITextView *nameTextView;
    __weak IBOutlet UITextView *attributesTextView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: _person.imgPath];
    UIImage *image = [UIImage imageWithData:imageData];
    [profileImage setImage:image];
    
    nameTextView.text = [NSString stringWithFormat:@"%@ %@", _person.firstName, _person.lastName];
    
    if (_person.type == Student) {
        GADStudent *student = (GADStudent *) _person;
        attributesTextView.text = [NSString stringWithFormat:@"Major: %@\nClass: %@\nEmail: %@\nBox: %@", student.major, student.classYear, student.email, student.box];
    } else if (_person.type == SGA) {
        GADSGA *sga = (GADSGA *) _person;
        attributesTextView.text = [NSString stringWithFormat:@"Title: %@\nOffice Phone: %@\nOffice Email: %@\nOffice Hours: %@\nMajor: %@\nClass: %@\nEmail: %@\nBox: %@", @"NEED FIELD", sga.office_phone, sga.office_email, sga.office_hours[0], sga.major, sga.classYear, sga.email, sga.box];
    } else if (_person.type == FacStaff) {
        GADFacStaff *facStaff = (GADFacStaff *) _person;
        attributesTextView.text = [NSString stringWithFormat:@"Title: %@\nDepartment: %@\nCampus Phone: %@\nEmail: %@\nCampus Address: %@\nCampus Box: %@", facStaff.title[0], facStaff.deptMajorClass, facStaff.phone, facStaff.email, facStaff.address, facStaff.box];
    }
    
    //TODO: Figure out how to display multiple titles/office hours, and whether they are important;
    //      Figure out how to get the SGA Title from a GADSGA person;
    
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

@end
