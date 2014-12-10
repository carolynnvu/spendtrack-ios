//
//  Purchase.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/10/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

-(Purchase*) initWithName:(NSString*)name
              andPrice:(double)price {
    
    if(self=[super init]) {
        _name = name;
        _price = price;

    }
    return self;
}

+(Purchase*) createPurchaseWithName: (NSString*)name
                andPrice:(double)price {
    
    Purchase* entry = [[Purchase alloc] initWithName:name
                                            andPrice:price];
    return entry;
}


@end
