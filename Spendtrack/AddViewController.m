//
//  AddViewController.m
//  Spendtrack
//
//  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
//

#import "AddViewController.h"
#import "RootViewController.h"

@interface AddViewController ()
@property (strong, nonatomic) RootViewController *root;
// For adding purchase
@property (weak, nonatomic) IBOutlet UITextField *addName;
@property (weak, nonatomic) IBOutlet UITextField *addPrice;
@property (weak, nonatomic) IBOutlet UIButton *addPhoto;
@property NSString *addCat;
@property UIImage *addImage;
@property (weak, nonatomic) IBOutlet UIImageView *photoBox;
@property (weak, nonatomic) IBOutlet UITextView *addNotes;
@property (weak, nonatomic) IBOutlet UIButton *addItem;
@property (weak, nonatomic) IBOutlet UIButton *catAction;
@property (weak, nonatomic) IBOutlet UITextField *addCatText;
//@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;

// For editing purchase
@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editPrice;
@property (weak, nonatomic) IBOutlet UIButton *editCatAction;
@property (weak, nonatomic) IBOutlet UITextField *editCatText;
@property NSString *editCat;
@property (weak, nonatomic) IBOutlet UIButton *editPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *editPhotoBox;
@property NSString *editImage;
@property (weak, nonatomic) IBOutlet UITextView *editNotes;
@property (weak, nonatomic) IBOutlet UIButton *editItem;
@end

@implementation AddViewController

// Action sheet for categories
- (IBAction)clickedCatAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Pick A Category"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Clothes", @"Education", @"Food", @"General", @"Household", @"Medical", @"Other", @"Personal", @"Shelter", @"Transportation", @"Utilities", nil];

    [actionSheet showInView:self.view];
}

// Handle actionsheet actions
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if(title != @"Cancel"){
        self.addCat = title;
        self.addCatText.text = self.addCat;
        self.editCat = title;
        self.editCatText.text = self.editCat;
    }
}

// Cat for edit
- (IBAction)clickedEditCat:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Pick A Category"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Clothes", @"Education", @"Food", @"General", @"Household", @"Medical", @"Other", @"Personal", @"Shelter", @"Transportation", @"Utilities", nil];
    
    [actionSheet showInView:self.view];
}


// Edits item
- (IBAction)clickedEditItem:(id)sender {
    _edName = _editName.text;
    _edPrice = [_editPrice.text doubleValue];
    _edCatText = _editCatText.text;
    _edPhotoBox = _editPhotoBox.image;
    _edNotes = _editNotes.text;
    
    // Clears fields for new item
    self.editName.text = @"";
    self.editPrice.text = @"";
    self.editCatText.text = @"";
    self.editPhotoBox.image = [UIImage imageNamed : @"full_breakfast"];
    self.editNotes.text = @"";
}

// Add item to list of purchases
- (IBAction)clickedAddItem:(id)sender {
    Purchase *purchase = [Purchase createPurchaseWithName:_addName.text
                                                 andPrice:[_addPrice.text doubleValue]
                                                 andPhoto:_addImage
                                              andCategory:_addCat
                                                 andNotes:_addNotes.text];
    [_root addPurchase:purchase];
    
    // Indicate item was added
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add Purchase"
                                                                   message:[NSString stringWithFormat:@"Added %@", purchase.name]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action){
                                                         NSLog(@"OK");
                                                     }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    NSLog(@"Just added %lu", [_root.purchases count]);
    // Clears fields for new item
    self.addName.text = @"";
    self.addPrice.text = @"";
    self.addCatText.text = @"";
    self.photoBox.image = [UIImage imageNamed : @"full_breakfast"];
    self.addNotes.text = @"";
    
}

// Add Image
- (IBAction)clickedAddPhoto:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *selectedImage = (UIImage*)[info objectForKey: UIImagePickerControllerOriginalImage];
    self.addImage = selectedImage;
    self.photoBox.image = selectedImage;
    self.editImage = selectedImage;
    self.editPhotoBox.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// Edit Image
- (IBAction)clickedEditPhoto:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:picker animated:YES completion:nil];
    }
}



-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Don't re-init RootViewController here.
    
    _root = (RootViewController*) [self tabBarController];
    _root.purchases = [[NSMutableArray alloc] init];

    _editName.text = _edName;
    _editPrice.text = [NSString stringWithFormat:@"%.2f", _edPrice];
    _editCatText.text = _edCatText;
    _editPhotoBox.image = _edPhotoBox;
    _editNotes.text = _edNotes;
    
    _addImage = [UIImage imageNamed : @"full_breakfast"];
    _photoBox.image = _addImage;
    _addCat = @"Others"; // Default category is others
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Code for Category Picker
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
*/

//Make keyboard go away
-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

//Touching background to close keyboard
-(IBAction)backTap:(id)sender{
    [self.addName resignFirstResponder];
    [self.addPrice resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
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
