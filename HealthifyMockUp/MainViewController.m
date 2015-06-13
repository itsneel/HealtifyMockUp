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
	PageContentViewController *startingViewController;
}

@end

@implementation MainViewController
int CNT = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self navigationBarTitle];
	
	
	// SUB VIEWS
	accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	[self.view addSubview:accordion];
	self.view.backgroundColor = [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1.000];
	
	UIPageControl *pageControl = [UIPageControl appearance];
	pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:0.5];
	pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
	pageControl.backgroundColor = [UIColor clearColor];
	pageControl.frame = CGRectMake(0, 0, 320, 10);
	
	startingViewController = [self viewControllerAtIndex:0];
	
	[accordion addHeader:[self createHeaderView:@"0 of 1850 Cal eaten" color:[UIColor colorWithRed:0.102 green:0.737 blue:0.612 alpha:1.000] slider:YES count:1] withView:[self createView:[UIColor colorWithRed:0.086 green:0.627 blue:0.522 alpha:1.000] count:1]];

	[accordion addHeader:[self createHeaderView:@"0 of 372 Cal burnt" color:[UIColor colorWithRed:0.608 green:0.349 blue:0.714 alpha:1.000] slider:YES count:2] withView:[self createView:[UIColor colorWithRed:0.557 green:0.267 blue:0.678 alpha:1.000] count:2]];

	[accordion addHeader:[self createHeaderView:@"62.0 kgs - Set Goal" color:[UIColor colorWithRed:0.902 green:0.494 blue:0.133 alpha:1.000] slider:NO count:3] withView:[self createView:[UIColor colorWithRed:0.827 green:0.329 blue:0.000 alpha:1.000] count:3]];
	
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

-(UIButton *)createHeaderView:(NSString *)title color:(UIColor *)color slider:(BOOL)slider count:(int)count{
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
	
	switch (count) {
		case 1:
			[self addLeftImage:header imageName:@"1.png"];
			break;
		case 2:
			[self addLeftImage:header imageName:@"2.png"];
			break;
		case 3:
			[self addLeftImage:header imageName:@"3.png"];
			break;
		default:
			break;
	}
	[self addRightImage:header];
	return header;
}

-(void)addLeftImage:(id)sender imageName:(NSString *)imageName{
	UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, (((UIButton *)sender).frame.size.height - 20)/2 , 20, 20)];
	image.image = [UIImage imageNamed:imageName];
	[sender addSubview:image];
}

-(void)addRightImage:(id)sender{
	UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(245, (((UIButton *)sender).frame.size.height - 20)/2 , 20, 20)];
	image.image = [UIImage imageNamed:@"3.png"];
	image.tag = 1989;
	[sender addSubview:image];
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
			self.firstPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
			self.firstPageViewController.dataSource = self;
			[self.firstPageViewController setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
			[self.firstPageViewController didMoveToParentViewController:self];
			self.firstPageViewController.view.frame = CGRectMake(0, 0, 0, 200);
			[self addChildViewController:_firstPageViewController];
			[view addSubview:_firstPageViewController.view];
			[self.firstPageViewController didMoveToParentViewController:self];
			break;
		case 2:
			self.secondPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
			self.secondPageViewController.dataSource = self;
			[self.secondPageViewController setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
			[self.secondPageViewController didMoveToParentViewController:self];
			self.secondPageViewController.view.frame = CGRectMake(0, 0, 0, 200);
			[self addChildViewController:_secondPageViewController];
			[view addSubview:_secondPageViewController.view];
			[self.secondPageViewController didMoveToParentViewController:self];
			break;
		case 3:
			self.thirdPageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
			self.thirdPageViewController.dataSource = self;
			[self.thirdPageViewController setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
			[self.thirdPageViewController didMoveToParentViewController:self];
			self.thirdPageViewController.view.frame = CGRectMake(0, 0, 0, 200);
			[self addChildViewController:_thirdPageViewController];
			[view addSubview:_thirdPageViewController.view];
			[self.thirdPageViewController didMoveToParentViewController:self];
			break;
	    default:
			break;
	}
	CNT = count;
	return view;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
	if ((index > 2))
			return nil;
	PageContentViewController * view;
	view = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController3"];
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
