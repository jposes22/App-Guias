//
//  PageController.h
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ComunicationChangePage<NSObject>
@optional
-(void)changePage:(NSUInteger)page;
@end
@interface PageController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) NSArray *listGuide;
@property (nonatomic) CGRect frame;
@property(nonatomic, weak)id<ComunicationChangePage>delegatePager;



-(void)initPageController;

-(void)goToPage:(NSUInteger)page;


@end
