//
//  Utilities.h
//  Spendtrack
//
//  Created by Carolynn Vu on 12/19/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+(BOOL)requestWithUrl:(NSString*)url andMethod:(NSString*)method andKeys:(NSArray*)keys andObjs:(NSArray*)objects;

@end
