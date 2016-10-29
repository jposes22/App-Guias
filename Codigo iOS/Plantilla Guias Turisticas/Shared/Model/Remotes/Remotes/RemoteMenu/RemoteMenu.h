//
//  RemoteMenu.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommunicationMenu<NSObject>
@optional
-(void) communicationUpdateMenu:(NSInteger) sended;
@end

@interface RemoteMenu : NSObject
@property (nonatomic, weak) id<CommunicationMenu> delegateMenu;

-(void)getMenu;

@end


