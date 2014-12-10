//
//  Purchase.h
//  Spendtrack
//
//  Created by Carolynn Vu on 12/10/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Purchase.h"

@interface Purchase : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) double price;

-(Purchase*) initWithName:(NSString*)name
             andPrice:(double)price;

+(Purchase*) createPurchaseWithName:(NSString*)name
                      andPrice:(double)price;


@end
