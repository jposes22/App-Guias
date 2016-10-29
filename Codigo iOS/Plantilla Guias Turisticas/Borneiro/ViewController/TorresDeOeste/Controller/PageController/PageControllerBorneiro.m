//
//  PageController.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PageController.h"
#import "SlideGuideBorneiro.h"
#import "Guia+CoreDataProperties.h"
@interface PageController()
@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic) NSUInteger myIndex;
@end
@implementation PageController

-(void)initPageController{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    //Set here
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.frame.size.width+8, self.frame.size.height)];
    
    SlideGuideBorneiro *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupPageControl];
}

- (void) setupPageControl{
    NSArray *subviews = self.pageController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    self.pageController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+40);
}
- (SlideGuideBorneiro *)viewControllerAtIndex:(NSUInteger)index {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GuiasBorneiro" bundle:nil];
    SlideGuideBorneiro *childViewController = [storyboard instantiateViewControllerWithIdentifier:@"SlideGuideBorneiro"];
    childViewController.index = index;
    if(_listGuide && _listGuide.count > 0){
        GuiaList * guia = [_listGuide objectAtIndex:index];
        if(guia){
            [childViewController setGuiaList:guia];
            [childViewController setIndex:index];
        }
    }
    
    
    return childViewController;
}
-(void)goToPage:(NSUInteger)page{
    UIPageViewControllerNavigationDirection direction;
    if(page <= _myIndex){
        direction = UIPageViewControllerNavigationDirectionReverse ;
    }
    else{
        direction = UIPageViewControllerNavigationDirectionForward ;
    }
    
    [_pageController setViewControllers:@[[self viewControllerAtIndex:page]]
                                      direction:direction
                                       animated:YES
                                     completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [(SlideGuideBorneiro *)viewController index];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [(SlideGuideBorneiro *)viewController index];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.listGuide count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
    
}
/*- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    
    return  _listGuide.count;
    
}*/

/*- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}*/
- (void)pageViewController:(UIPageViewController *)pvc didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (!completed){
        return;
    }
    NSUInteger currentIndex = [[self.pageController.viewControllers lastObject] index];
    if(_delegatePager && [_delegatePager respondsToSelector:@selector(changePage:)]){
        [_delegatePager changePage:currentIndex];
    }
}

@end
