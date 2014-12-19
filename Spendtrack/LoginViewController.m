//
//  LoginViewController.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "LoginViewController.h"
#import "Utilities.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
//Method to prepare for segue.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)loginButtonPressed:(id)sender {
    if([[self.usernameTextField text] isEqualToString:@""] || [[self.passwordTextField text] isEqualToString:@""]) {
        [self alertMssg:@"Try again!" :@"Invalid entry." :0];
    }
    else {
        NSString *usernameInput = [self.usernameTextField text];
        NSString *passwordInput = [self.passwordTextField text];
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", nil];
        NSArray *objs = [NSArray arrayWithObjects:usernameInput, passwordInput, nil];
        
        BOOL request = [Utilities requestWithUrl:@"http://localhost:3000/login" andMethod:@"POST" andKeys:keys andObjs:objs];
        
        if(request) {
            NSLog(@"Success: user logged in!");
           [self performSegueWithIdentifier:@"loginSegueToRootVC" sender:self];
        } else {
            [self alertMssg:@"Try again!" :@"Failed to login." :0];
        }
    }
}

- (IBAction)signupButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"loginSegueToSignup" sender:self];
}

-(void)alertMssg:(NSString *)mssg :(NSString *)title :(int)tag {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:mssg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil, nil];
    
    [alertView show];
    
}

//Make keyboard go away
-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

//Touching background to close keyboard
-(IBAction)backTap:(id)sender{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

@end
