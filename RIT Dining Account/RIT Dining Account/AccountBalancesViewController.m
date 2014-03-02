//
//  AccountBalancesViewController.m
//  RIT Dining Account
//
//  Created by Jason A Smith on 3/2/14.
//  Copyright (c) 2014 Jason A. Smith. All rights reserved.
//

#import "AccountBalancesViewController.h"

#define PADDING 6.0

@interface AccountBalancesViewController ()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *tigerBucksLabel;
@property (strong, nonatomic) UILabel *foodDebitLabel;
@property (strong, nonatomic) UILabel *mealPlanNameLabel;
@property (strong, nonatomic) UILabel *mealPlanLabel;
@property (strong, nonatomic) UILabel *optionLabel;

@end

@implementation AccountBalancesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Initialize title label
        self.titleLabel = [AccountBalancesViewController titleRowWithText:@"Current Dining Account Balances"];
        
        // Initialize balance row labels
        self.tigerBucksLabel = [AccountBalancesViewController balanceRowWithText:@"Tiger Bucks Balance"];
        self.foodDebitLabel = [AccountBalancesViewController balanceRowWithText:@"Food Debit Balance"];
        self.mealPlanNameLabel = [AccountBalancesViewController balanceRowWithText:@"Meal Plan"];
        self.mealPlanLabel = [AccountBalancesViewController balanceRowWithText:@"Meal Plan Balance"];
        self.optionLabel = [AccountBalancesViewController balanceRowWithText:@"Option Balance"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self positionLabels];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self positionLabels];
}

#pragma mark - Instance Utility Methods

- (void)positionLabels
{
    [self positionTitleRowLabel:self.titleLabel];
    
    [self positionBalanceRowLabel:self.tigerBucksLabel
                       AfterLabel:self.titleLabel];
    
    [self positionBalanceRowLabel:self.foodDebitLabel
                       AfterLabel:self.tigerBucksLabel];
    
    [self positionBalanceRowLabel:self.mealPlanNameLabel
                       AfterLabel:self.foodDebitLabel];
    
    [self positionBalanceRowLabel:self.mealPlanLabel
                       AfterLabel:self.mealPlanNameLabel];
    
    [self positionBalanceRowLabel:self.optionLabel
                       AfterLabel:self.mealPlanLabel];
}

- (void)positionTitleRowLabel:(UILabel *)label
{
    label.x = PADDING;
    label.y = 40.0;
    label.height = 25.0;
    label.width = self.view.width - (PADDING * 2);
    
    [self.view addSubview:label];
}

- (void)positionBalanceRowLabel:(UILabel *)label AfterLabel:(UILabel *)previousLabel
{
    label.x = PADDING;
    label.y = previousLabel.bottom + 20.0;
    label.height = 25.0;
    label.width = self.view.width - (PADDING * 2);
    
    [self.view addSubview:label];
    
    [self drawLineAfterLabel:label];
}

- (void)drawLineAfterLabel:(UILabel *)label
{
    CGRect labelBoundingRect = [label.text boundingRectWithSize:self.view.size
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{ NSFontAttributeName:label.font }
                                                        context:nil];
    
    UIView *thinLine = [UIView new];
    thinLine.x = PADDING + labelBoundingRect.size.width + PADDING;
    thinLine.y = label.bottom - 6.0;
    thinLine.width = self.view.bounds.size.width - (PADDING * 3) - labelBoundingRect.size.width;
    thinLine.height = 0.4;
    thinLine.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:thinLine];
}

#pragma mark - Class Utility Methods

+ (UILabel *)titleRowWithText:(NSString *)text
{
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:19.0];
    
    return label;
}

+ (UILabel *)balanceRowWithText:(NSString *)text
{
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0];
    
    return label;
}

@end
