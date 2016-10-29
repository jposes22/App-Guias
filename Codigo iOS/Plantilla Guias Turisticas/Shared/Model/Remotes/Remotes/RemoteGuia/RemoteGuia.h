//
//  RemoteGuia.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationGuia<NSObject>

@optional
-(void) communicationUpdateGuia:(NSInteger) sended;
@end

@interface RemoteGuia : NSObject
@property (nonatomic, weak) id<CommunicationGuia> delegateGuia;
-(void)getGuia;
@end
