//
//  LoginViewController.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "LoginViewController.h"

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



-(IBAction)backTap:(id)sender{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

- (IBAction)signupPressed:(id)sender {
    [self performSegueWithIdentifier:@"loginSegueToSignup" sender:sender];
}

- (IBAction)loginPressed:(id)sender {
    if([[self.usernameTextField text] isEqualToString:@""] || [[self.passwordTextField text] isEqualToString:@""]) {
        NSLog(@"Something something something");
        [self alertMssg:@"Invalid entry!" :@"Failed to register." :0];
    }
    else {
        NSString *usernameInput = [self.usernameTextField text];
        NSString *passwordInput = [self.passwordTextField text];
        //            [self performSegueWithIdentifier:@"unwindFromSignupViewController" sender:sender];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/login"]];
        request.HTTPMethod = @"POST";
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", nil];
        NSArray *objs = [NSArray arrayWithObjects:usernameInput, passwordInput, nil];
        NSDictionary *dataDictionary = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
        NSError *error = [[NSError alloc] init];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDictionary options:NSJSONWritingPrettyPrinted error:&error];
        NSString *requestBodyData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; //For test-printing only.
        NSLog(@"Data ---> %@", requestBodyData);
        request.HTTPBody = jsonData;
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        NSHTTPURLResponse *response = nil;
        NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if([response statusCode] >= 200 && [response statusCode] < 400) {
            NSLog(@"Success: user logged in!");
            [self performSegueWithIdentifier:@"loginSegueToList" sender:self];
        }
    }

}


-(IBAction) unwindFromSignupViewController:(UIStoryboardSegue*) segue {
    
}

-(void)alertMssg:(NSString *)mssg :(NSString *)title :(int)tag {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:mssg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil, nil];
    
}

@end
