//
//  TipPercentStorage.h
//  tipcalculator
//
//  Created by Ankit Nitin Shah on 1/6/14.
//  Copyright (c) 2014 yahoo. All rights reserved.

//  storage for user settings for tip percentages with save and load methods

//

#import <Foundation/Foundation.h>

@interface TipPercentStorage : NSObject

@property (nonatomic) int defaultTipPercent;
@property (nonatomic) int secondTipPercent;
@property (nonatomic) int thirdTipPercent;

- (TipPercentStorage*)initWithLoad;

- (void) loadValueFromUserDefaults;

- (void) saveTipDefaultPercent:(int) defaultPercent secondPercent:(int) secondPercent thirdPercent:(int) thirdPercent;

@end
