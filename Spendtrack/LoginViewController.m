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
    NSInteger success = 0;

    if([[self.usernameTextField text] isEqualToString:@""] || [[self.passwordTextField text] isEqualToString:@""]) {
        [self alertMssg:@"Invalid username or password!" :@"Failed to login." :0];
    } else {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/signup"]];
        request.HTTPMethod = @"POST";
        [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
                                                                            
//        NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@", [self.usernameTextField text], [self.passwordTextField text]];
//        
//        NSURL *url = [NSURL URLWithString:@"http://localhost:3000/login"];
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"lu", (unsigned long)[postData length]];
//
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//        [request setURL:url];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        [request setHTTPBody:postData];
        
//        NSError *error = [[NSError alloc] init];
//        NSHTTPURLResponse *response = nil;
//        NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        
//        if([response statusCode] >= 200 && [response statusCode] < 400) {
//            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
//            NSLog(@"Response ==> %@", responseData);
//            NSError *error = nil;
//            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:urlData options:NSJSONReadingMutableContainers error:&error];
//        
//            success = [jsonData[@"success"] integerValue];
//            if(success) {
//                NSLog(@"Login successful");
//            } else {
//                NSString *error_mssg = (NSString*) jsonData[@"error_message"];
//                [self alertMssg:error_mssg :@"Sign in failed."  :0];
//            }
//        }
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
