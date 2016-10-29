//
//  MenuHeader.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RightViewController.h"


@interface MenuHeader : NSObject

@property (nonatomic, strong) NSString *titleHeader;
@property (nonatomic)BOOL isLoged;
@property (nonatomic) SideDrawerMenuItem idElementMenu;

-(id) initWithTitle:(NSString*) titleHeader idElementMenu:(SideDrawerMenuItem) idElementMenu;
-(void) updateStatusUser;

@end
