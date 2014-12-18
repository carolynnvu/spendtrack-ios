////
////  EditViewController.m
////  Spendtrack
////
////  Created by Christina on 12/17/14.
////  Copyright (c) 2014 Carolynn Vu and Christina Chan. All rights reserved.
////
//
//#import "EditViewController.h"
//#import "RootViewController.h"
//
//@interface EditViewController ()
//@property (strong, nonatomic) RootViewController *root;
//@property (weak, nonatomic) IBOutlet UITextField *editName;
//@property (weak, nonatomic) IBOutlet UITextField *editPrice;
//@property (weak, nonatomic) IBOutlet UIButton *editPhoto;
//@property NSString *editCat;
//@property UIImage *editImage;
//@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
//@property (weak, nonatomic) IBOutlet UITextView *editNotes;
//@property (weak, nonatomic) IBOutlet UIImageView *photoBox;
//@property (weak, nonatomic) IBOutlet UIButton *editItem;
//
//@end
//
//@implementation EditViewController
//
//- (IBAction)clickededitItem:(id)sender {
//    
//}
//
//- (IBAction)clickedEditPhoto:(id)sender {
//    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//        [self presentViewController:picker animated:YES completion:nil];
//    }
//}
//
//-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}
//
//-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//    UIImage *selectedImage = (UIImage*)[info objectForKey: UIImagePickerControllerOriginalImage];
//    self.editImage = selectedImage;
//    self.photoBox.image = selectedImage;
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}
//
//
//-(void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    // Don't re-init RootViewController here.
//    
//    _root = (RootViewController*) [self tabBarController];
//    _root.purchases = [[NSMutableArray alloc] init];
//    _editImage = [UIImage imageNamed : @"full_breakfast"];
//    _editCat = @"Others"; // Default category is others
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//#pragma mark -
//#pragma mark Picker Data Source Methods
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 1;
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    return [self.root.categoryArray count];
//}
//
//
//
//#pragma mark Picker Delegate Methods
//- (NSString *)pickerView:(UIPickerView *)pickerView
//             titleForRow:(NSInteger)row
//            forComponent:(NSInteger)component
//{
//    return self.root.categoryArray[row];
//}
//
//- (void)pickerView:(UIPickerView *)pickerView
//      didSelectRow:(NSInteger)row
//       inComponent:(NSInteger)component{
//    NSString *selectedCategory = self.root.categoryArray[row];
//    self.editCat = selectedCategory;
//}
//
////Make keyboard go away
//-(IBAction)textFieldDoneEditing:(id)sender{
//    [sender resignFirstResponder];
//}
//
////Touching background to close keyboard
//-(IBAction)backTap:(id)sender{
//    [self.editName resignFirstResponder];
//    [self.editPrice resignFirstResponder];
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [[self view] endEditing:YES];
//}
//
///*
// #pragma mark - Navigation
// 
// // In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// // Get the new view controller using [segue destinationViewController].
// // Pass the selected object to the new view controller.
// }
// */
//
//@end
