//
//  RemotePoi.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationPoi<NSObject>
@optional
-(void) communicationUpdatePoi:(NSInteger) sended;
@end
@interface RemotePoi : NSObject
@property (nonatomic, weak) id<CommunicationPoi> delegatePoi;
-(void)getPoi;
@end
