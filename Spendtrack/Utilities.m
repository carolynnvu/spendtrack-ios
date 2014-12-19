//
//  Utilities.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/19/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+(BOOL)requestWithUrl:(NSString*)url andMethod:(NSString*)method andKeys:(NSArray*)keys andObjs:(NSArray*)objs {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod=method;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *dataDictionary = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
    NSError *error = [[NSError alloc] init];
    NSData *json = [NSJSONSerialization dataWithJSONObject:dataDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *requestBodyData = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding]; //For test-printing only!
    request.HTTPBody = json;
    
    //Send the request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //Get the response
    NSHTTPURLResponse *response = nil;
    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if([response statusCode] >= 200 && [response statusCode] <400) {
        return TRUE;
    }
    return FALSE;
}
@end
