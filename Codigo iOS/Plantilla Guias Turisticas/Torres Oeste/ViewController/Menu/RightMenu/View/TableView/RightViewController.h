//
//  RightViewController.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@protocol RightMenuComunication <NSObject>
@optional
-(void) changeCenterViewControllerWithMenu:(SideDrawerMenuItem) SideDrawerMenuSelected;

@end

@interface RightViewController : UITableViewController
@property (nonatomic,weak)id <RightMenuComunication> delegateRightMenu;

@end
