//
//  SignupViewController.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/18/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "SignupViewController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupButtonPressed:(id)sender {
    NSInteger success = 0;
    
    NSLog(@"Hello");
    
    if([[self.emailTextField text] isEqualToString:@""] || [[self.usernameTextField text] isEqualToString:@""] || [[self.passwordTextField text] isEqualToString:@""]) {
        NSLog(@"Something something something");
        [self alertMssg:@"Invalid entry!" :@"Failed to register." :0];
        }
        else {
            NSString *emailInput = [self.emailTextField text];
            NSString *usernameInput = [self.usernameTextField text];
            NSString *passwordInput = [self.passwordTextField text];
//            [self performSegueWithIdentifier:@"unwindFromSignupViewController" sender:sender];
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:3000/signup"]];
            request.HTTPMethod = @"POST";
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//            NSString *data = [[NSString alloc] initWithFormat:@"email=%@&username=%@&password=%@", [self.emailTextField text],[self.usernameTextField text], [self.passwordTextField text]];
            
            NSArray *keys = [NSArray arrayWithObjects:@"email", @"username", @"password", nil];
            NSArray *objs = [NSArray arrayWithObjects:emailInput, usernameInput, passwordInput, nil];
            NSDictionary *dataDictionary = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
            NSError *error = [[NSError alloc] init];
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataDictionary options:NSJSONWritingPrettyPrinted error:&error];
            NSString *requestBodyData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]; //For test-printing
            NSLog(@"Data ---> %@", requestBodyData);
            request.HTTPBody = jsonData;
            NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

            NSHTTPURLResponse *response = nil;
            NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
            if([response statusCode] >= 200 && [response statusCode] < 400) {
                NSLog(@"SUCCESS");
            }
    }
}

-(void)alertMssg:(NSString *)mssg :(NSString *)title :(int)tag {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:mssg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil, nil];
    
}

@end
