#import "GADListViewController.h"
#import "GADDetailViewController.h"
#import "GADResultTableViewCell.h"
#import "GADPerson.h"
#import "GADDirectory.h"

@interface GADListViewController () {
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation GADListViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResult.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GADResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listViewCell"];
    GADPerson *person = self.searchResult[indexPath.row];
    cell.person = person;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: person.imgPath];
    UIImage *profileImage = [UIImage imageWithData: imageData];
    [cell.profileImage setImage:profileImage];
    NSString *fullName = [[person.firstName stringByAppendingString: @" "]stringByAppendingString: person.lastName];
    NSString *email = person.email;
    NSString *dept;
    NSString *detail;
    if (person.type == Student || person.type == SGA) {
        GADStudent *student = (GADStudent *) person;
        detail = student.classYear;
        dept = student.major;
    } else if (person.type == FacStaff) {
        GADFacStaff *facStaff = (GADFacStaff *) person;
        detail = facStaff.title[0];
        dept = facStaff.title[5];
    }
    
    cell.nameText.text = fullName;
    cell.resultText.text = [NSString stringWithFormat:@"%@\n%@\n%@", email, dept, detail];
    cell.resultText.userInteractionEnabled = NO;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.82 green:0.22 blue:0.22 alpha:1.0];
}

- (void)viewDidAppear:(BOOL)animated {
    
    /* This method retrieved data from the test server, it will be left here
     since the new API will hopefully be similar
    [GADQuery executeWithDict:_criteria Username:@"test1stu" Password:@"selfserv1" completionHandler:^void(NSArray<GADPerson *> * people,NSError *error){
        self.searchResult = people;
        dispatch_async(dispatch_get_main_queue(),^(void){
            [self.tableView reloadData];
        });
    }]; */
    
    self.searchResult = GADPerson.dummyPeople;
    dispatch_async(dispatch_get_main_queue(),^(void){
        [self.tableView reloadData];
    });
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
        GADResultTableViewCell *cell = (GADResultTableViewCell *) sender;
        dest.person = cell.person;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
