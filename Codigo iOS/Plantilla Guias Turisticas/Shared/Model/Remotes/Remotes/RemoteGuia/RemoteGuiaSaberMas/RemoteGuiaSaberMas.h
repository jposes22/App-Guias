//
//  RemoteGuiaSaberMas.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationGuiaSaberMas<NSObject>

@optional
-(void) communicationUpdateGuiaSaberMas:(NSInteger) sended;
@end
@interface RemoteGuiaSaberMas : NSObject
@property (nonatomic, weak) id<CommunicationGuiaSaberMas> delegateGuiaSaberMas;
-(void)getGuiaSaberMas;
@end
