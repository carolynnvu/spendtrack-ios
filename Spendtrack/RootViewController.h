//
//  RootViewController.h
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Purchase.h"

@interface RootViewController : UITabBarController

@property NSArray *categoryArray;

@property NSMutableArray *purchases;

-(void)initPurchaseArray;
-(void)addPurchase: (Purchase*)purchase;

@end
