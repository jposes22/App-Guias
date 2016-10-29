//
//  MenuObject.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "MenuObject.h"

@implementation MenuObject
-(id)initWithTitle:(NSString *) titleRow iconRow:(UIImage *) iconRow idElementMenu:(SideDrawerMenuItem) idElementMenu{

    if(self = [super init]){
        _titleRow = titleRow;
        _iconRow = iconRow;
        _idElementMenu = idElementMenu;
    }
    return self;

}
@end
