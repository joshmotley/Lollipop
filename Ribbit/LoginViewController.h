//
//  LoginViewController.h
//  Ribbit
//
//  Created by Joshua Motley on 8/10/15.
//  Copyright (c) 2015 TeamTreeHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameLoginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordLoginField;

- (IBAction)login:(id)sender;

@end
