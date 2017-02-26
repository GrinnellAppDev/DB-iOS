#import "GADListViewController.h"
#import "GADDetailViewController.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADListViewController () {
}

@end

@implementation GADListViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResult.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listViewCell"];
    UIImage *profileImage = [UIImage imageNamed: @"ProfileImageEx.png"]; //need to change given data online
    [cell.imageView setImage:profileImage];
    GADPerson *person=self.searchResult[indexPath.row];
    NSString *fullName = [person.firstName stringByAppendingString: person.lastName];
    cell.textLabel.text = fullName;
    //cell.detailTextLabel.text = [self.searchResult[indexPath.row] valueForKey:@"major"];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueName = @"showDetail";
    if ([segue.identifier isEqualToString:segueName]) {
        GADDetailViewController *dest = (GADDetailViewController *)segue.destinationViewController;
        dest.person = self.searchResult[[sender indexPath].row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
