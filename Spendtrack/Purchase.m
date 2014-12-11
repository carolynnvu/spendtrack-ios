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
                 andPrice:(double)price
                 andPhoto:(NSString*)photo
              andCategory:(NSString*)category {
    
    if(self=[super init]) {
        _name = name;
        _price = price;
        _photo = photo;
        _category = category;
    }
    return self;
}

+(Purchase*) createPurchaseWithName: (NSString*)name
                andPrice:(double)price
                andPhoto:(NSString*)photo
                andCategory:(NSString *)category{
    
    Purchase* entry = [[Purchase alloc] initWithName:name
                                            andPrice:price
                                            andPhoto:photo
                                         andCategory:category];
    return entry;
}


@end
