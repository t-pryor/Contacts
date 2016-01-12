//
//  ViewController.m
//  Contacts
//
//  Created by Tim Pryor on 2016-01-11.
//  Copyright © 2016 Tim Pryor. All rights reserved.
//

#import "ContactsViewController.h"


// this header file exposes your Swift code to the file that imports it
// contains interfaces for your Swift code to share with the ObjC component of your app
// naming convention is ProductModuleName-Swift.h


#import "Contacts-Swift.h"


@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        _contacts = [NSMutableArray array];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;
}

// Unwind segue
// allows you to define a relationship between a a view controller and the VC that preceeds it in the navigation flow
// mechanism for creating backwards navigation
// must first write an unwind method programmatically on the VC you want to unwind to
// expose this method to the storyboard via the IBAction return type

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue
{
    // No action to take if user cancels
}

// define a new unwind action

- (IBAction)createNewContact:(UIStoryboardSegue *)segue
{
   
    // uses segue parameter passed into method's argument to get sourceViewController that originnated the unwind acition
    NewContactViewController *newContactVC = segue.sourceViewController;
    
    NSString *firstName = newContactVC.firstNameTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *contactName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *newContact = [[Contact alloc] initWithContactName:contactName];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
    
}


@end
