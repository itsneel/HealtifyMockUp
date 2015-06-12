//
//  MainViewController.m
//  HealthifyMockUp
//
//  Created by Neelanshu Goyal on 12/06/15.
//
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set title of navigation bar
	[self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,20,0,30)];
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20.0f];
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.text =@"HealthifyMe";
	[self.navigationItem setTitleView:titleLabel];
	
	

	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
