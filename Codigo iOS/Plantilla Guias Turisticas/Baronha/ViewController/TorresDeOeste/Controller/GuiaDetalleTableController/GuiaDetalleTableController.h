//
//  GuiaDetalleTableController.h
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol CommunicationTableController <NSObject>
@optional

- (void)communicationImageSelected:(NSArray *)list;
- (void)comunicationPlayAudioGuia:(GuiaList *)guia;

@end

@interface GuiaDetalleTableController : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * listOfDetalleGuia;
@property (nonatomic, strong) GuiaList * guia;

@property (nonatomic, weak) id<CommunicationTableController> delegateTableController;
@end
