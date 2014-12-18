//
//  AddViewController.h
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AddViewController : UIViewController
//<UIPickerViewDelegate, UIPickerViewDataSource,
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
@property NSString *edName;
@property double edPrice;
@property NSString *edCatText;
@property UIImage *edPhotoBox;
@property NSString *edNotes;
@end
