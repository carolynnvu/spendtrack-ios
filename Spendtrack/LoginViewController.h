//
//  LoginViewController.h
//  Spendtrack
//
//  Created by Carolynn Vu on 12/18/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)buttonPressed:(UIButton *)sender;



@end
