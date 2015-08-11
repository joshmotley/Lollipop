//
//  UIViewController+SignupViewController.m
//  Ribbit
//
//  Created by Joshua Motley on 8/10/15.
//  Copyright (c) 2015 TeamTreeHouse. All rights reserved.
//

#import "SignupViewController.h"


@implementation SignupViewController : UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(IBAction)signup:(id)sender
{
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0 || [email length] == 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a username, password, and email address!" delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil];
    
    [alertView show];}
        
    
        
    
}


@end
