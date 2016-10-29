//
//  MenuObject.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RightViewController.h"
@interface MenuObject : NSObject
@property (nonatomic, strong) NSString *titleRow;
@property (nonatomic, strong) UIImage *iconRow;
@property (nonatomic) SideDrawerMenuItem idElementMenu;

-(id)initWithTitle:(NSString *) titleRow iconRow:(UIImage *) iconRow idElementMenu:(SideDrawerMenuItem) idElementMenu;

@end
