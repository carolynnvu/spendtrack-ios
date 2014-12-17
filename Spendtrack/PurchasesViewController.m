//
//  PurchasesViewController.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "PurchasesViewController.h"
#import "Purchase.h"
#import "PurchasesCollectionViewController.h"
#import "PurchaseTableViewCell.h"
#import "RootViewController.h"


@interface PurchasesViewController ()

@property (strong, nonatomic) RootViewController *root;

@end

@implementation PurchasesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _root = (RootViewController*) [self tabBarController];
    [_root initPurchaseArray];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_root.purchases count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PurchaseTableViewCell *cell = (PurchaseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PurchaseCell"];
    
    Purchase *purchase = (_root.purchases)[indexPath.row];
    cell.nameLabel.text = purchase.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"$%.2f", purchase.price]; //Note...label should be changed to price.
    cell.purchaseImageView.image = purchase.photo; //[UIImage imageNamed:purchase.photo];
    
    return cell;
}

// Tap on table cell to see alert about purchase
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Purchase *purchase = (_root.purchases)[indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Purchase Info"
                                 message:[NSString stringWithFormat:@"Name: %@\nCategory: %@\nPrice: $%.2f\nNotes: %@ ", purchase.name, purchase.category, purchase.price, purchase.notes]
                                 delegate:nil cancelButtonTitle:@"OK"
                                 otherButtonTitles:@"Edit", nil];
    [messageAlert show];
}

// Edit option
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (([alertView.title isEqualToString:@"Purchase Info"])&&(buttonIndex==1)) {
        NSLog(@"Hi");
    }
}

// Swipe to delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_root.purchases removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

//Segue method to go to PurchasesCollectionViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"TableSegueToCollection"]) {
        UINavigationController *navController = [segue destinationViewController];
        PurchasesCollectionViewController *purchasesCollectionVC = (PurchasesCollectionViewController *)([navController viewControllers][0]);
        
        [purchasesCollectionVC setRoot:self.root];
    }
    
}


@end
