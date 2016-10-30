//
//  AlbumPagerController.h
//  TorresDeOeste
//
//  Created by Evelb on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlbumPagerController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) NSArray *listImages;
@property (nonatomic) CGRect frame;

-(void)initPageController;

@end
