//
//  RootViewController.m
//  Spendtrack
//
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
    
    self.categoryArray=@[@"Clothes", @"Education", @"Food", @"General", @"Household", @"Medical", @"Other", @"Personal", @"Shelter", @"Transportation", @"Utilities"];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:12.0f/255.0f
                                                           green:122.0f/255.0f
                                                            blue:68.0f/255.0f
                                                           alpha:1.0f]];
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
