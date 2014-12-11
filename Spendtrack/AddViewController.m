//
//  AddViewController.m
//  Spendtrack
//
//  Created by Carolynn Vu on 12/10/14.
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "AddViewController.h"
#import "RootViewController.h"

@interface AddViewController ()

@property (strong, nonatomic) RootViewController *root;
@property (weak, nonatomic) IBOutlet UITextField *addName;
@property (weak, nonatomic) IBOutlet UITextField *addPrice;
@property (weak, nonatomic) IBOutlet UIButton *addPhoto;
@property NSString *addCat;
@property UIImage *addImage;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIButton *addItem;

@end

@implementation AddViewController

- (IBAction)clickedAddItem:(id)sender {
    Purchase *purchase = [Purchase createPurchaseWithName:_addName.text
                                                 andPrice:[_addPrice.text doubleValue]
                                                 andPhoto:_addImage
                                              andCategory:_addCat];
    [_root addPurchase:purchase];

    
}

- (IBAction)clickedAddPhoto:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *selectedImage = (UIImage*)[info objectForKey: UIImagePickerControllerOriginalImage];
    _addImage = selectedImage;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Don't re-init RootViewController here.
    
    _root = (RootViewController*) [self tabBarController];
    _root.purchases = [[NSMutableArray alloc] init];
    _addImage = [UIImage imageWithContentsOfFile: @"full_breakfast"];
    _addCat = @"Low";
}

-(void)viewDidAppear {
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.root.categoryArray count];
}
 


#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
          forComponent:(NSInteger)component
{
    return self.root.categoryArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    NSString *selectedCategory = self.root.categoryArray[row];
    self.addCat = selectedCategory;
}

//Make keyboard go away
-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
/*
//Touching background to close keyboard
-(IBAction)backTap:(id)sender{
    [self.addName resignFirstResponder];
    [self.addPrice resignFirstResponder];
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
