#import "GADListViewController.h"
#import "GADDetailViewController.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADListViewController () {
    NSArray *listOfPeople;
}

@end

@implementation GADListViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listOfPeople.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listViewCell"];
    UIImage *profileImage = [UIImage imageNamed: @"ProfileImageEx.png"]; //need to change given data online
    [cell.imageView setImage:profileImage];
    NSString *fullName = [[listOfPeople[indexPath.row] valueForKey:@"firstName"] stringByAppendingString: [listOfPeople[indexPath.row] valueForKey:@"lastName"]];
    cell.textLabel.text = fullName;
    cell.detailTextLabel.text = [listOfPeople[indexPath.row] valueForKey:@"major"];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    listOfPeople = @[];
    
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
        dest.person = listOfPeople[[sender indexPath].row];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
