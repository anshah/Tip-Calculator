//
//  TipPercentStorage.m
//  tipcalculator
//
//  Created by Ankit Nitin Shah on 1/6/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "TipPercentStorage.h"

@implementation TipPercentStorage

- (TipPercentStorage*)initWithLoad {
    self = [self init];
    if(self){
        [self loadValueFromUserDefaults];
    }
    return self;
}

- (void) loadValueFromUserDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaultTipPercent = [defaults integerForKey:@"DefaultTipPercent"];
    self.secondTipPercent = [defaults integerForKey:@"SecondTipPercent"];
    self.thirdTipPercent = [defaults integerForKey:@"ThirdTipPercent"];
    if(self.defaultTipPercent == 0){
        self.defaultTipPercent = 10;
    }
    if(self.secondTipPercent == 0){
        self.secondTipPercent = 15;
    }
    if(self.thirdTipPercent == 0){
        self.thirdTipPercent = 20;
    }
}

- (void)saveTipDefaultPercent:(int) defaultPercent secondPercent:(int) secondPercent thirdPercent:(int) thirdPercent{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if(defaultPercent != 0){
        [defaults setInteger: defaultPercent forKey:@"DefaultTipPercent"];
        self.defaultTipPercent = defaultPercent;
    }
    if(secondPercent != 0){
        [defaults setInteger:secondPercent forKey:@"SecondTipPercent"];
        self.secondTipPercent = secondPercent;
    }
    if(thirdPercent != 0){
        [defaults setInteger:thirdPercent forKey:@"ThirdTipPercent"];
        self.thirdTipPercent = thirdPercent;
    }
    [defaults synchronize];
    
}

@end
