//
//  AccountBalancesViewController.m
//  RIT Dining Account
//
//  Created by Jason A Smith on 3/2/14.
//  Copyright (c) 2014 Jason A. Smith. All rights reserved.
//

#import "AccountBalancesViewController.h"

@interface AccountBalancesViewController ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation AccountBalancesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.titleLabel = [UILabel new];
        self.titleLabel.height = 25.0;
        self.titleLabel.width = self.view.width;
        self.titleLabel.y = self.view.y + 50.0;
        self.titleLabel.text = @"Current Dining Account Balances";
        self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:21.0];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
