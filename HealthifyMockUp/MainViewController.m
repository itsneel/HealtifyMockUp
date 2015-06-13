//
//  MainViewController.m
//  HealthifyMockUp
//
//  Created by Neelanshu Goyal on 12/06/15.
//
//

#import "MainViewController.h"

@interface MainViewController (){
	UIColor * BGColor;
}

@end

@implementation MainViewController
int count = 3;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self navigationBarTitle];
	
	
	// SUB VIEWS

	_bgColors = @[[UIColor redColor], [UIColor blackColor], [UIColor blueColor]];
	
	accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[self.view addSubview:accordion];
	self.view.backgroundColor = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1.000];
	
	
	self.pageViewController1 = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
	self.pageViewController1.dataSource = self;
	
	UIPageControl *pageControl = [UIPageControl appearance];
	pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:0.5];
	pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
	pageControl.backgroundColor = [UIColor clearColor];
	pageControl.frame = CGRectMake(0, 0, 320, 10);
	
	PageContentViewController *startingViewController1 = [self viewControllerAtIndex:0];
	NSArray *viewControllers1 = @[startingViewController1];
	[self.pageViewController1 setViewControllers:viewControllers1 direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
	[self.pageViewController1 didMoveToParentViewController:self];

	[accordion addHeader:[self createHeaderView:@"0 of 1850 Cal eaten" color:[UIColor colorWithRed:0.102 green:0.737 blue:0.612 alpha:1.000] slider:YES] withView:[self createView:[UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000] count:1]];

	self.pageViewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
	self.pageViewController2.dataSource = self;

	PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
	NSArray *viewControllers = @[startingViewController];
	[self.pageViewController2 setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
	[self.pageViewController2 didMoveToParentViewController:self];

	[accordion addHeader:[self createHeaderView:@"0 of 372 Cal burnt" color:[UIColor colorWithRed:0.608 green:0.349 blue:0.714 alpha:1.000] slider:YES] withView:[self createView:[UIColor colorWithRed:0.557 green:0.267 blue:0.678 alpha:1.000] count:2]];
	
	self.pageViewController3 = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
	self.pageViewController3.dataSource = self;

	PageContentViewController *startingViewController3 = [self viewControllerAtIndex:0];
	NSArray *viewControllers3 = @[startingViewController3];
	[self.pageViewController3 setViewControllers:viewControllers3 direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
	[self.pageViewController3 didMoveToParentViewController:self];

	[accordion addHeader:[self createHeaderView:@"62.0 kgs - Set Goal" color:[UIColor colorWithRed:0.902 green:0.494 blue:0.133 alpha:1.000] slider:NO] withView:[self createView:[UIColor colorWithRed:0.827 green:0.329 blue:0.000 alpha:1.000] count:3]];
	
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
	UIButton *header = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 70)];
	[header setTitle:title forState:UIControlStateNormal];
	header.backgroundColor = color;
	header.layer.shadowColor = [UIColor blackColor].CGColor;
	header.layer.shadowOffset = CGSizeMake(0, 3);
	header.layer.shadowOpacity = 0.3;
	header.layer.shadowRadius = 4.0;
	if (slider) {
		[self addSlider:header];
	}
	header.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
	header.contentEdgeInsets = UIEdgeInsetsMake(0, 40, 10, 0);
	[self addSideButton:header color:color];
	return header;
}

-(void)addLeftImage:(id)sender{
	
	
}

-(void)addRightImage:(id)sender{
	
	
}

-(void)addSlider:(id)sender{
	UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 50, 200, 10)];
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

-(UIView *)createView:(UIColor *)color count:(int)count{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 190)];
	view.backgroundColor = color;
	switch (count) {
		case 1:
			// Change the size of page view controller
			self.pageViewController1.view.frame = CGRectMake(0, 0, 0, 200);
			
			[self addChildViewController:_pageViewController1];
			[view addSubview:_pageViewController1.view];
			[self.pageViewController1 didMoveToParentViewController:self];
			
			break;
		case 2:
			// Change the size of page view controller
			self.pageViewController2.view.frame = CGRectMake(0, 0, 0, 200);
			
			[self addChildViewController:_pageViewController2];
			[view addSubview:_pageViewController2.view];
			[self.pageViewController2 didMoveToParentViewController:self];
			
			break;
		case 3:
			// Change the size of page view controller
			self.pageViewController3.view.frame = CGRectMake(0, 0, 0, 200);
			
			[self addChildViewController:_pageViewController3];
			[view addSubview:_pageViewController3.view];
			[self.pageViewController3 didMoveToParentViewController:self];
			
			break;
	    default:
			break;
	}
	return view;
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
	
	if ((index >= 3))
		return nil;
		
	// Create a new view controller and pass suitable data.
	PageContentViewController * view = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
	view.BGCOLOR = [self.bgColors objectAtIndex:index];
	view.pageIndex = index;
	
	return view;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
	
	if ((index == 0) || (index == NSNotFound)) {
		return nil;
	}
	
	index--;
	return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
	
	if (index == NSNotFound) {
		return nil;
	}
	
	index++;
	return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
	return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
	return 0;
}

@end
