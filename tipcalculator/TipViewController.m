//
//  TipViewController.m
//  tipcalculator
//
//  Created by Ankit Nitin Shah on 1/5/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"
#import "TipPercentStorage.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;

@property (nonatomic, strong) TipPercentStorage *tipPercentStorage;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
        self.tipPercentStorage = [[TipPercentStorage alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    //refresh from storage and update segmentedcontrol views with percentages
    [self.tipPercentStorage loadValueFromUserDefaults];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", self.tipPercentStorage.defaultTipPercent ] forSegmentAtIndex:0];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", self.tipPercentStorage.secondTipPercent ] forSegmentAtIndex:1];
    [self.tipControl setTitle: [NSString stringWithFormat:@"%d", self.tipPercentStorage.thirdTipPercent ] forSegmentAtIndex:2];
    
    [self updateValues];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

//recalculate the total and display
- (void) updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(self.tipPercentStorage.defaultTipPercent/100.0), @(self.tipPercentStorage.secondTipPercent/100.0), @(self.tipPercentStorage.thirdTipPercent/100.0)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

- (void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated: YES];
}

@end
