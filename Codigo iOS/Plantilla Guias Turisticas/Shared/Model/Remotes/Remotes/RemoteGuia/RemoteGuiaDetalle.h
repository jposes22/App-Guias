//
//  RemoteGuiaDetalle.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationGuiaDetalle<NSObject>

@optional
-(void) communicationUpdateGuiaDetalle:(NSInteger) sended;
@end
@interface RemoteGuiaDetalle : NSObject
@property (nonatomic, weak) id<CommunicationGuiaDetalle> delegateGuiaDetalle;
-(void)getGuiasDetalle;
@end
