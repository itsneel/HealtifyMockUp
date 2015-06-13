
#import <UIKit/UIKit.h>

@class AccordionView;
@protocol AccordionViewDelegate <NSObject>
@optional
- (void)accordion:(AccordionView *)accordion didChangeSelection:(NSIndexSet *)selection;
@end

@interface AccordionView : UIView <UIScrollViewDelegate> {
    NSMutableArray *views;
    NSMutableArray *headers;
    NSMutableArray *originalSizes;
}

- (void)addHeader:(UIControl *)aHeader withView:(id)aView;
- (void)removeHeaderAtIndex:(NSInteger)index;
- (void)setOriginalSize:(CGSize)size forIndex:(NSUInteger)index;
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) NSInteger selectedIndex;
@property (readonly) BOOL isHorizontal;
@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, assign) UIViewAnimationCurve animationCurve;
@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, strong) NSIndexSet *selectionIndexes;
@property (nonatomic, strong) id <AccordionViewDelegate> delegate;
@property (nonatomic, assign) BOOL startsClosed;
@property (nonatomic, assign) BOOL allowsEmptySelection;
@property (nonatomic, assign) BOOL autoScrollToTopOnSelect;

@end