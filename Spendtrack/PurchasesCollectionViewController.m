//
//  PurchasesCollectionViewController.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/11/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "PurchasesCollectionViewController.h"
#import "PurchasesViewController.h"
#import "PurchaseCollectionViewCell.h"
#import "RootViewController.h"
#import "Purchase.h"

@interface PurchasesCollectionViewController ()

@end

@implementation PurchasesCollectionViewController

//static NSString * const reuseIdentifier = @"PurchaseCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    _root = (RootViewController*) [self tabBarController];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _root = (RootViewController*) [self tabBarController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if([segue.identifier isEqualToString:@"CollectionSegueToTable"]) {
//        
//        RootViewController *rootVC = [segue destinationViewController];
//        PurchasesViewController *purchasesVC = (PurchasesViewController *)([rootVC viewControllers][0]);
//        [rootVC setPurchases: _root.purchases];
//    }
//}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"Number of items %lu", [_root.purchases count]);
    return [_root.purchases count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"PurchaseCollectionCell";
//    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
////    recipeImageView.image = [UIImage imageNamed:[recipePhotos objectAtIndex:indexPath.row]];
//    recipeImageView.image = [UIImage imageNamed:@"angry_birds_cake.png"];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    
    PurchaseCollectionViewCell *cell = (PurchaseCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"PurchaseCollectionCell" forIndexPath:indexPath];
    
    Purchase *purchase = (_root.purchases)[indexPath.row];
    cell.purchaseImageView.image = purchase.photo;
    
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
