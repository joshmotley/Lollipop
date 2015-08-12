//
//  EditFriendsViewController.m
//  Ribbit
//
//  Created by Joshua Motley on 8/11/15.
//  Copyright (c) 2015 TeamTreeHouse. All rights reserved.
//

#import "EditFriendsViewController.h"
#import "FriendsViewController.h"


@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(error){
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else{
            self.allUsers = objects;
            
            // Let's table know there is more data to add
            [self.tableView reloadData];
            
        }
    }];
    
    //set current user property using the currentUser method of the PFUser class
    self.currentUser = [PFUser currentUser];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.allUsers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if([self isFriend:user]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    [friendsRelation addObject:user];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        }];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - Helper methods

-(BOOL)isFriend:(PFUser *)user{
    
    for(PFUser *friend in self.friends){
        if([friend.objectId isEqualToString:user.objectId]){
            return YES;
        }
    }
    return NO;}




@end
