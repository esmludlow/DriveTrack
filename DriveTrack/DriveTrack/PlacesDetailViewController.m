//
//  PlacesDetailViewController.m
//  DriveTrack
//
//  Created by Rutan on 8/27/15.
//  Copyright (c) 2015 EricLudlowRadicalApplications. All rights reserved.
//

#import "PlacesDetailViewController.h"

@interface PlacesDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *isAFavoritePlaceStarButton;
@property (weak, nonatomic) IBOutlet UITextField *placeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeStreetAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeCityTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeStateTextField;
@property (weak, nonatomic) IBOutlet UITextField *placeZipTextField;
@property (weak, nonatomic) IBOutlet UIButton *placeClearDeleteButton;

@end

@implementation PlacesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.isNewPlace) {
        
        self.title = @"New Place";
        
    } else {
        
        self.title = @"Place Details";
        [self.isAFavoritePlaceStarButton setImage:[UIImage imageNamed:@"starFilled60"] forState:UIControlStateNormal];
        self.placeNameTextField.text = @"Name of a place";
        self.placeStreetAddressTextField.text = @"1001 N. Street St.";
        self.placeCityTextField.text = @"Somewhere";
        self.placeStateTextField.text = @"Utah";
        self.placeZipTextField.text = @"84???";
        [self.placeClearDeleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    }
}

- (IBAction)placeClearDeleteButtonPressed:(id)sender {
    
    if (self.isNewPlace) {
        
        //method to clear all fields
    } else {
        
        [self presentDeleteConfirm];
    }
}

- (void)presentDeleteConfirm {
    
    UIAlertController *deleteAlert = [UIAlertController alertControllerWithTitle:@"Pressing delete will remove this Place permanently."
                                                                      message:@"Press 'Delete' to confirm or 'Cancel' to keep this Place."
                                                               preferredStyle:UIAlertControllerStyleActionSheet];
    
    [deleteAlert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                    style:UIAlertActionStyleDefault
                                                  handler:nil]];
    
    [deleteAlert addAction:[UIAlertAction actionWithTitle:@"Delete"
                                                 style:UIAlertActionStyleDestructive
                                               handler:^(UIAlertAction *action) {
                                                   //delete Place using Model Controller
                                               }]];
    
    [self.navigationController presentViewController:deleteAlert
                                            animated:YES
                                          completion:nil];
}



# pragma mark - Memory Warning method

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
