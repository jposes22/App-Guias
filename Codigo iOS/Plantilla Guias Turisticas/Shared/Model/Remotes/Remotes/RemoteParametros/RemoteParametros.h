//
//  RemoteParametros.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationParametros<NSObject>
@optional
-(void) communicationUpdateParametros:(NSInteger) sended;
@end
@interface RemoteParametros : NSObject
@property (nonatomic, weak) id<CommunicationParametros> delegateParametros;

-(void)getParametros;

@end
