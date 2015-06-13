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

	accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[self.view addSubview:accordion];
	self.view.backgroundColor = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1.000];
	
	// Only height is taken into account, so other parameters are just dummy
	UIButton *header1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
	[header1 setTitle:@"First row" forState:UIControlStateNormal];
	header1.backgroundColor = [UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000];
	
	UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
	view1.backgroundColor = [UIColor colorWithRed:0.102 green:0.737 blue:0.612 alpha:1.000];
		
	[accordion addHeader:header1 withView:view1];
	
	
	UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
	[header2 setTitle:@"Second row" forState:UIControlStateNormal];
	header2.backgroundColor = [UIColor colorWithRed:0.557 green:0.267 blue:0.678 alpha:1.000];
	
	UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
	view2.backgroundColor = [UIColor colorWithRed:0.608 green:0.349 blue:0.714 alpha:1.000];
	
	[accordion addHeader:header2 withView:view2];
	
	
	UIButton *header3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
	[header3 setTitle:@"Third row" forState:UIControlStateNormal];
	header3.backgroundColor = [UIColor colorWithRed:0.827 green:0.329 blue:0.000 alpha:1.000];
	
	UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
	view3.backgroundColor = [UIColor colorWithRed:0.902 green:0.494 blue:0.133 alpha:1.000];
	
	[accordion addHeader:header3 withView:view3];
	[accordion setNeedsLayout];
	[accordion setAllowsMultipleSelection:YES];
	[accordion setAllowsEmptySelection:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
