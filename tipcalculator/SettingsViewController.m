//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Ankit Nitin Shah on 1/5/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipPercentStorage.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *defaultTipPercentTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTipPercentTextField;
@property (weak, nonatomic) IBOutlet UITextField *thirdTipPercentTextField;
- (IBAction)hideKeyboard:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Load previous values from user settings and display in text fields
    TipPercentStorage *tipPercentStorage = [[TipPercentStorage alloc] initWithLoad];
    [self.defaultTipPercentTextField setText: [@(tipPercentStorage.defaultTipPercent) stringValue]];
    [self.secondTipPercentTextField setText: [@(tipPercentStorage.secondTipPercent) stringValue]];
    [self.thirdTipPercentTextField setText: [@(tipPercentStorage.thirdTipPercent) stringValue]];

}

//save tip values when view disappears
- (void) viewWillDisappear:(BOOL)animated{
    TipPercentStorage *tipPercentStorage = [[TipPercentStorage alloc] init];
    [tipPercentStorage saveTipDefaultPercent:[self.defaultTipPercentTextField.text integerValue] secondPercent:[self.secondTipPercentTextField.text integerValue] thirdPercent:[self.thirdTipPercentTextField.text integerValue]];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

@end
