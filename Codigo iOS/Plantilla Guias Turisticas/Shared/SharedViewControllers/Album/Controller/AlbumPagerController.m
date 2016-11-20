//
//  AlbumPagerController.m
//  TorresDeOeste
//
//  Created by Evelb on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "AlbumPagerController.h"
#import "ViewImageViewController.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
@interface AlbumPagerController()
@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic) NSUInteger myIndex;
@end
@implementation AlbumPagerController
-(void)initPageController{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    //Set here
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [self.view setBackgroundColor: [UIColor blackColor]];
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.frame.size.width+8, self.frame.size.height)];
    
    ViewImageViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    [self.pageController.view setBackgroundColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (ViewImageViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    ViewImageViewController *childViewController = [[ViewImageViewController alloc] initWithNibName:@"ViewImageViewController" bundle:nil];
    childViewController.index = index;
    if(_listImages && _listImages.count > 0){
        [childViewController setImageShow:((GuiaDetalleImagen *)[_listImages objectAtIndex:index]).urlImagen];
        [childViewController setIndex:index];
    }
    
    return childViewController;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [(ViewImageViewController *)viewController index];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [(ViewImageViewController *)viewController index];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.listImages count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
    
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
 
 return  _listImages.count;
 
 }

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
 // The selected item reflected in the page indicator.
 return 0;
 }

@end
