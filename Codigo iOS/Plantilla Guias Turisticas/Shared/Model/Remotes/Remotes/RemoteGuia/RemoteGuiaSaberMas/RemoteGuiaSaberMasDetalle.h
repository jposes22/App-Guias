//
//  RemoteGuiaSaberMasDetalle.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationGuiaSaberMasDetalle<NSObject>

@optional
-(void) communicationUpdateGuiaSaberMasDetalle:(NSInteger) sended;
@end
@interface RemoteGuiaSaberMasDetalle : NSObject
@property (nonatomic, weak) id<CommunicationGuiaSaberMasDetalle> delegateGuiaSaberMasDetalle;
-(void)getGuiaSaberMasDetalle;
@end
