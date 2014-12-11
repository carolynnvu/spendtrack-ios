//
//  RootViewController.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/10/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "RootViewController.h"
#import "PurchasesCollectionViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(void)initPurchaseArray {
    _purchases = [[NSMutableArray alloc] init];
}

-(void)addPurchase: (Purchase*)purchase {
    [_purchases addObject:purchase];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.categoryArray=@[@"Food", @"Shelter", @"Utilities", @"Transportation", @"Medical", @"Household", @"Personal", @"Education", @"General", @"Other"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindFromCollectionView:(UIStoryboardSegue *)segue {
    NSLog(@"%@", segue.identifier);
    PurchasesCollectionViewController *purchasesCollectionVC = segue.sourceViewController;
    //    _root.purchases = purchasesCollectionVC.root.purchases;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
