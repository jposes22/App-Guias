//
//  RemoteIdioma.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CommunicationIdioma<NSObject>
@optional
-(void) communicationUpdateIdiomas:(NSInteger) sended;
@end
@interface RemoteIdioma : NSObject
@property (nonatomic, weak) id<CommunicationIdioma> delegateIdioma;

-(void)getIdiomas;
@end
