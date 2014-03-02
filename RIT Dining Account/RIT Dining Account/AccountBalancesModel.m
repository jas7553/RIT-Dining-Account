//
//  AccountBalancesModel.h
//  RIT Dining Account
//
//  Created by Jason A Smith on 3/2/14.
//  Copyright (c) 2014 Jason A. Smith. All rights reserved.
//

#import "AccountBalancesModel.h"

@interface AccountBalancesModel ()

@end

@implementation AccountBalancesModel

- (float)tigerBucksBalance
{
    return 120.12;
}

- (float)foodDebitBalance
{
    return 320.15;
}

- (NSString *)mealPlan
{
    return @"All Debit";
}

- (float)mealPlanBalance
{
    return 23.64;
}

- (float)optionBalanceLabel
{
    return 234.32;
}

@end
