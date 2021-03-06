#import "GADPerson.h"
#import "GADStudent.h"
#import "GADSGA.h"
#import "GADFacStaff.h"

@implementation GADPerson

-(GADPerson *)initWithDictionary: (NSDictionary *) dict {
    GADPerson *person;
    if ([[dict valueForKey:@"personType"] isEqual: @"Student"]) {
        person = [[GADStudent alloc] initWithDictionary:dict];
    } else {
        person = [[GADFacStaff alloc] initWithDictionary:dict];
    }
    
    person.firstName = [dict valueForKey:@"firstName"];
    person.lastName = [dict valueForKey:@"lastName"];
    person.userName = [dict valueForKey:@"userName"];
    person.box = [dict valueForKey:@"box"];
    person.email = [dict valueForKey:@"email"];
    person.address = [dict valueForKey:@"address"];
    person.phone = [dict valueForKey:@"phone"];
    person.personType = [dict valueForKey:@"personType"];
    person.homeAddress = [dict valueForKey:@"homeAddress"];
    
    // Handling the case where imgPath is null
    if ([dict valueForKey:@"imgPath"] == (id)[NSNull null]) {
        person.imgPath = [NSURL URLWithString:@"https://itwebapps.grinnell.edu/PcardImages/moved/link/gone.jpg"];
    } else {
        person.imgPath = [NSURL URLWithString:[dict valueForKey:@"imgPath"]];
    }
    
    return person;
}

+(NSArray <GADPerson*>*)dummyPeople{
    NSArray <GADPerson*> *people;
    GADStudent *person1=[[GADStudent alloc] init];
    GADFacStaff *person2=[[GADFacStaff alloc] init];
    GADSGA *person3=[[GADSGA alloc] init];

    person1.firstName=@"Ziwen";
    person1.lastName=@"Chen";
    person1.email=@"chenziwe@grinnell.edu";
    person1.imgPath=[NSURL URLWithString:@"https://itwebapps.grinnell.edu/PcardImages/moved/20763.jpg"];
    person1.address=@"8242 Norris Hall East";
    person1.box=@"3163";
    person1.major=@"Undeclared";
    person1.classYear=@"2020";
    
    person2.firstName=@"Peter-Michael";
    person2.lastName=@"Osera";
    person2.email=@"oserapet@grinnell.edu";
    person2.address=@"3811 Science";
    person2.box=@"SCIE";
    person2.phone=@"4010";
    person2.homeAddress=@"1804 3rd Ave";
    person2.titles=@[@"Assistant Professor of Computer Science", @"Department Chair of Computer Science"];
    person2.departments=@[@"Computer Science", @"Music"];
    person2.imgPath=[NSURL URLWithString:@"https://itwebapps.grinnell.edu/PcardImages/moved/84326.jpg"];
    
    person3.firstName=@"Anita";
    person3.lastName=@"Dewitt";
    person3.box=@"3339";
    person3.major=@"Computer Science/Music";
    person3.email=@"dewittan17@grinnell.edu";
    person3.homeAddress=@"347 Drake Ave";
    person3.address=@"Hannibal Kershaw Hall 2349";
    person3.classYear=@"2017";
    person3.imgPath=[NSURL URLWithString:@"https://itwebapps.grinnell.edu/PcardImages/moved/22619.jpg"];
    person3.office_phone=@"4310";
    person3.office_email=@"sgaprez";
    person3.position_name=@"President";
    person3.office_hours=@[@"Sunday: 7-8pm Grille, 8-9pm JRC 222",@"Monday: 9 - 3 Commons",@"Tuesday: 7 -7 JRC Main",@"Wednesday: 12 - 12 Raynard's Office"];

    people=@[person1,person2,person3];
    
    return people;
}

-(void)printInfo{
    NSLog(@"%u",_type);
    NSLog(@"%@",_firstName);
    NSLog(@"%@",_lastName);
    NSLog(@"%@",_imgPath);

    if (_type==0){
        GADStudent *student=[GADStudent new];
        student=(GADStudent*)self;
        NSLog(@"%@",student.major);
        NSLog(@"%@",student.classYear);
    }
    else if (_type==1){
        GADFacStaff *faculty=[GADFacStaff new];
        faculty=(GADFacStaff*)self;
        NSLog(@"%@",faculty.titles);
    }
    else if (_type==2){
        GADSGA *SGA=[GADSGA new];
        SGA=(GADSGA*)self;
        NSLog(@"%@",SGA.office_hours);
    }
}

@end
