//
//  NextViewController.m
//  HealthifyMockUp
//
//  Created by Neelanshu Goyal on 13/06/15.
//
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self navigationBarTitle];
	self.view.backgroundColor = self.BGColor;
	self.label.text = self.text;
	
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
