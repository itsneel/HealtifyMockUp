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

@property (strong, nonatomic) UIPageViewController *pageViewController1;

@property (strong, nonatomic) UIPageViewController *pageViewController2;

@property (strong, nonatomic) UIPageViewController *pageViewController3;

@property (strong, nonatomic) NSArray *bgColors;

@end
