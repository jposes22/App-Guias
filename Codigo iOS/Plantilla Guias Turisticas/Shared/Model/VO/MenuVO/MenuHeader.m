//
//  MenuHeader.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "MenuHeader.h"

@implementation MenuHeader
-(id) initWithTitle:(NSString*) titleHeader idElementMenu:(SideDrawerMenuItem) idElementMenu{

    if(self = [super init]){
        _titleHeader = titleHeader;
        _idElementMenu = idElementMenu;
    
    }
    return self;
}

//check if user is loged or not and change values of object
-(void) updateStatusUser{


}
@end
