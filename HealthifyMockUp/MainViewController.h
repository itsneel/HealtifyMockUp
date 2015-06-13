//
//  MainViewController.h
//  HealthifyMockUp
//
//  Created by Neelanshu Goyal on 12/06/15.
//
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"
#import "PageContentViewController.h"

@interface MainViewController : UIViewController <UIPageViewControllerDataSource> {
	AccordionView * accordion;
}

@property (strong, nonatomic) UIPageViewController *firstPageViewController;
@property (strong, nonatomic) UIPageViewController *secondPageViewController;
@property (strong, nonatomic) UIPageViewController *thirdPageViewController;

@end
