//
//  NavigationBar.h
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CommnicationMenu <NSObject>
@optional
-(void)openMenu;
@end
@interface NavigationBar : UIView
@property (nonatomic, weak) id<CommnicationMenu>delegateNavigationBar;
-(void)initView:(NSString *)title;

@end
