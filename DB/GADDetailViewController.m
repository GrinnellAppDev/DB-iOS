#import "GADDetailViewController.h"
#import "GADPerson.h"

@interface GADDetailViewController ()

@end

@implementation GADDetailViewController {
    
    __weak IBOutlet UIImageView *profileImage;
    __weak IBOutlet UITextView *nameTextView;
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

@end
