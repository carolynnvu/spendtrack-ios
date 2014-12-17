//
//  PurchaseTableViewCell.h
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UIImageView *purchaseImageView;

@end
