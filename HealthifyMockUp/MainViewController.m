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
	
	[self navigationBarTitle];
	accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[self.view addSubview:accordion];
	self.view.backgroundColor = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1.000];
	
	
	[accordion addHeader:[self createHeaderView:@"0 of 1850 Cal eaten" color:[UIColor colorWithRed:0.102 green:0.737 blue:0.612 alpha:1.000] slider:YES] withView:[self createView:[UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000]]];
	
	[accordion addHeader:[self createHeaderView:@"0 of 372 Cal burnt" color:[UIColor colorWithRed:0.608 green:0.349 blue:0.714 alpha:1.000] slider:YES] withView:[self createView:[UIColor colorWithRed:0.557 green:0.267 blue:0.678 alpha:1.000]]];
	
	[accordion addHeader:[self createHeaderView:@"62.0 kgs - Set Goal" color:[UIColor colorWithRed:0.902 green:0.494 blue:0.133 alpha:1.000] slider:NO] withView:[self createView:[UIColor colorWithRed:0.827 green:0.329 blue:0.000 alpha:1.000]]];
	
	[accordion setNeedsLayout];
	[accordion setAllowsMultipleSelection:YES];
	[accordion setAllowsEmptySelection:YES];
}

-(void)navigationBarTitle{
	// set title of navigation bar
	[self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,20,0,30)];
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20.0f];
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.text =@"HealthifyMe";
	[self.navigationItem setTitleView:titleLabel];
}

-(UIButton *)createHeaderView:(NSString *)title color:(UIColor *)color slider:(BOOL)slider{
	UIButton *header = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 60)];
	[header setTitle:title forState:UIControlStateNormal];
	header.backgroundColor = color;
	header.layer.shadowColor = [UIColor blackColor].CGColor;
	header.layer.shadowOffset = CGSizeMake(0, 3);
	header.layer.shadowOpacity = 0.3;
	header.layer.shadowRadius = 4.0;
	if (slider) {
		[self addSlider:header];
	}
	[self addSideButton:header color:color];
	return header;
}

-(void)addLeftImage:(id)sender{
	
	
}

-(void)addRightImage:(id)sender{
	
	
}

-(void)addSlider:(id)sender{
	UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 40, 200, 10)];
	slider.minimumTrackTintColor = [UIColor greenColor];
	slider.maximumTrackTintColor = [UIColor redColor];
	slider.thumbTintColor = [UIColor clearColor];
	slider.userInteractionEnabled = NO;
	[sender addSubview:slider];
	[sender bringSubviewToFront:slider];
}

-(void)addSideButton:(id)sender color:(UIColor *)color{
	UIButton *sideButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 0, 40, ((UIButton *)sender).frame.size.height)];
	[sideButton setTitle:@"+" forState:UIControlStateNormal];
	[sideButton setTintColor:[UIColor whiteColor]];
	sideButton.backgroundColor = color;
	sideButton.layer.shadowColor = [UIColor blackColor].CGColor;
	sideButton.layer.shadowOffset = CGSizeMake(-3, 0);
	sideButton.layer.shadowOpacity = 0.3;
	sideButton.layer.shadowRadius = 1.0;
	[sender addSubview:sideButton];
	[sender bringSubviewToFront:sideButton];
}

-(UIView *)createView:(UIColor *)color{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 150)];
	view.backgroundColor = color;
	return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
