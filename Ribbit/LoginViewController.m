//
//  LoginViewController.m
//  Ribbit
//
//  Created by Joshua Motley on 8/10/15.
//  Copyright (c) 2015 TeamTreeHouse. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]]];
    
}

- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameLoginField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordLoginField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
        
        [alertView show];}
else
{[PFUser logInWithUsernameInBackground:username  password:password
                                 block:^(PFUser *user, NSError *error) {
                                     if (user) {[self.navigationController popToRootViewControllerAnimated:YES];
                                        
                                     } else {
                                         // The login failed. Check error to see why.
                                     }
                                 }];}

    
}



        

@end
