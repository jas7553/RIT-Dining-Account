//
//  AccountBalancesViewController.m
//  RIT Dining Account
//
//  Created by Jason A Smith on 3/2/14.
//  Copyright (c) 2014 Jason A. Smith. All rights reserved.
//

#import "AccountBalancesViewController.h"
#import "AccountBalancesModel.h"

#define PADDING 6.0

@interface AccountBalancesViewController ()

@property (strong, nonatomic) AccountBalancesModel *accountBalancesModel;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *tigerBucksLabel;
@property (strong, nonatomic) UILabel *foodDebitLabel;
@property (strong, nonatomic) UILabel *mealPlanNameLabel;
@property (strong, nonatomic) UILabel *mealPlanLabel;
@property (strong, nonatomic) UILabel *optionLabel;

@property (strong, nonatomic) UILabel *tigerBucksBalanceLabel;
@property (strong, nonatomic) UILabel *foodDebitBalanceLabel;
@property (strong, nonatomic) UILabel *mealPlanValueLabel;
@property (strong, nonatomic) UILabel *mealPlanBalanceLabel;
@property (strong, nonatomic) UILabel *optionBalanceLabel;

@end

@implementation AccountBalancesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.accountBalancesModel = [AccountBalancesModel new];
        
        // Initialize title label
        self.titleLabel = [AccountBalancesViewController titleRowWithText:@"Current Dining Account Balances"];
        
        // Initialize balance row labels
        self.tigerBucksLabel = [AccountBalancesViewController balanceRowNameWithText:@"Tiger Bucks Balance"];
        self.foodDebitLabel = [AccountBalancesViewController balanceRowNameWithText:@"Food Debit Balance"];
        self.mealPlanNameLabel = [AccountBalancesViewController balanceRowNameWithText:@"Meal Plan"];
        self.mealPlanLabel = [AccountBalancesViewController balanceRowNameWithText:@"Meal Plan Balance"];
        self.optionLabel = [AccountBalancesViewController balanceRowNameWithText:@"Option Balance"];
        
        self.tigerBucksBalanceLabel = [AccountBalancesViewController balanceRowValueWithText:[NSString stringWithFormat:@"$ %.02f", [self.accountBalancesModel tigerBucksBalance]]];
        self.foodDebitBalanceLabel = [AccountBalancesViewController balanceRowValueWithText:[NSString stringWithFormat:@"$ %.02f", [self.accountBalancesModel foodDebitBalance]]];
        self.mealPlanValueLabel = [AccountBalancesViewController balanceRowValueWithText:[NSString stringWithFormat:@"%@", [self.accountBalancesModel mealPlan]]];
        self.mealPlanBalanceLabel = [AccountBalancesViewController balanceRowValueWithText:[NSString stringWithFormat:@"$ %.02f", [self.accountBalancesModel mealPlanBalance]]];
        self.optionBalanceLabel = [AccountBalancesViewController balanceRowValueWithText:[NSString stringWithFormat:@"$ %.02f", [self.accountBalancesModel optionBalanceLabel]]];
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
    
    // Position name labels
    [self positionBalanceRowNameLabel:self.tigerBucksLabel
                           AfterLabel:self.titleLabel];
    
    [self positionBalanceRowNameLabel:self.foodDebitLabel
                           AfterLabel:self.tigerBucksLabel];
    
    [self positionBalanceRowNameLabel:self.mealPlanNameLabel
                           AfterLabel:self.foodDebitLabel];
    
    [self positionBalanceRowNameLabel:self.mealPlanLabel
                           AfterLabel:self.mealPlanNameLabel];
    
    [self positionBalanceRowNameLabel:self.optionLabel
                           AfterLabel:self.mealPlanLabel];
    
    // Position value labels
    [self positionBalanceRowValueLabel:self.tigerBucksBalanceLabel
                           NextToLabel:self.tigerBucksLabel];
    
    [self positionBalanceRowValueLabel:self.foodDebitBalanceLabel
                           NextToLabel:self.foodDebitLabel];
    
    [self positionBalanceRowValueLabel:self.mealPlanValueLabel
                           NextToLabel:self.mealPlanNameLabel];
    
    [self positionBalanceRowValueLabel:self.mealPlanBalanceLabel
                           NextToLabel:self.mealPlanLabel];
    
    [self positionBalanceRowValueLabel:self.optionBalanceLabel
                           NextToLabel:self.optionLabel];
    
    // Draw lines between name and value labels
    [self drawLineBetweenLeftLabel:self.tigerBucksLabel
                     AndRightLabel:self.tigerBucksBalanceLabel];
    
    [self drawLineBetweenLeftLabel:self.foodDebitLabel
                     AndRightLabel:self.foodDebitBalanceLabel];
    
    [self drawLineBetweenLeftLabel:self.mealPlanNameLabel
                     AndRightLabel:self.mealPlanValueLabel];
    
    [self drawLineBetweenLeftLabel:self.mealPlanLabel
                     AndRightLabel:self.mealPlanBalanceLabel];
    
    [self drawLineBetweenLeftLabel:self.optionLabel
                     AndRightLabel:self.optionBalanceLabel];
    
}

- (void)positionTitleRowLabel:(UILabel *)label
{
    label.x = PADDING;
    label.y = 40.0;
    label.height = 25.0;
    label.width = self.view.width - (PADDING * 2);
    
    [self.view addSubview:label];
}

- (void)positionBalanceRowNameLabel:(UILabel *)label AfterLabel:(UILabel *)previousLabel
{
    label.x = PADDING;
    label.y = previousLabel.bottom + 20.0;
    label.height = 25.0;
    label.width = self.view.width - (PADDING * 2);
    
    [self.view addSubview:label];
}

- (void)positionBalanceRowValueLabel:(UILabel *)label NextToLabel:(UILabel *)nameLabel
{
    label.height = 25.0;
    label.width = self.view.width - (PADDING * 2);
    label.bottom = nameLabel.bottom;
    label.right = self.view.width - PADDING;
    
    [self.view addSubview:label];
}

- (void)drawLineBetweenLeftLabel:(UILabel *)leftLabel AndRightLabel:(UILabel *)rightLabel
{
    CGRect leftLabelBoundingRect = [self boundingBoxOfLabel:leftLabel];
    CGRect rightLabelBoundingRect = [self boundingBoxOfLabel:rightLabel];
    
    UIView *thinLine = [UIView new];
    thinLine.x = PADDING + leftLabelBoundingRect.size.width + PADDING;
    thinLine.y = leftLabel.bottom - 6.0;
    thinLine.width = self.view.bounds.size.width - leftLabelBoundingRect.size.width - rightLabelBoundingRect.size.width - (PADDING * 4);
    thinLine.height = 0.4;
    thinLine.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:thinLine];
}

- (CGRect)boundingBoxOfLabel:(UILabel *)label
{
    return [label.text boundingRectWithSize:self.view.size
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{ NSFontAttributeName:label.font }
                                    context:nil];
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

+ (UILabel *)balanceRowNameWithText:(NSString *)text
{
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0];
    
    return label;
}

+ (UILabel *)balanceRowValueWithText:(NSString *)text
{
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15.0];
    
    return label;
}

@end
