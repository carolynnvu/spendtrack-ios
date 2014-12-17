//
//  Purchase.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

-(Purchase*) initWithName:(NSString*)name
                 andPrice:(double)price
                 andPhoto:(UIImage*)photo
              andCategory:(NSString*)category
                 andNotes:(NSString*)notes{
    
    if(self=[super init]) {
        _name = name;
        _price = price;
        _photo = photo;
        _category = category;
        _notes = notes;
    }
    return self;
}

+(Purchase*) createPurchaseWithName: (NSString*)name
                andPrice:(double)price
                andPhoto:(UIImage*)photo
                andCategory:(NSString *)category
                andNotes:(NSString *)notes{
    
    Purchase* entry = [[Purchase alloc] initWithName:name
                                            andPrice:price
                                            andPhoto:photo
                                         andCategory:category
                                              andNotes:notes];
    return entry;
}


@end
