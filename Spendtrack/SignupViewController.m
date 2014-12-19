//
//  SignupViewController.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "SignupViewController.h"
#import "Utilities.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
//Method to prepare for any segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


- (IBAction)joinButtonPressed:(id)sender {
    if([[self.emailTextField text] isEqualToString:@""] || [[self.usernameTextField text] isEqualToString:@""] || [[self.passwordTextField text] isEqualToString:@""]) {
        NSLog(@"Something something something");
        [self alertMssg:@"Try again!" :@"Invalid entry." :0];
    }
    else {
        NSString *emailInput = [self.emailTextField text];
        NSString *usernameInput = [self.usernameTextField text];
        NSString *passwordInput = [self.passwordTextField text];
        NSArray *keys = [NSArray arrayWithObjects:@"email", @"username", @"password", nil];
        NSArray *objs = [NSArray arrayWithObjects:emailInput, usernameInput, passwordInput, nil];
        
        BOOL request = [Utilities requestWithUrl:@"http://localhost:3000/signup" andMethod:@"POST" andKeys:keys andObjs:objs];
        
        if(request) {
            [self alertMssg:@"You are now registered." :@"Success!" :0];
            [self performSegueWithIdentifier:@"signupSegueToLogin" sender:self];
        } else {
            [self alertMssg:@"Try again." :@"Failed to register!." :0];
        }
    }
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
