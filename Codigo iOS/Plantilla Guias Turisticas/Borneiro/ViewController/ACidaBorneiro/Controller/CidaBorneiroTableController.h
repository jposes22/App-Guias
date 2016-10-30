//
//  CidaBorneiroTableController.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 30/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol CommunicationCidaTableController <NSObject>
@optional

- (void)communicationImageSelected:(NSArray *)list;
- (void)comunicationPlayAudioGuia:(GuiaList *)guia;

@end

@interface CidaBorneiroTableController : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * listOfDetalleGuia;
@property (nonatomic, strong) GuiaList * guia;

@property (nonatomic, weak) id<CommunicationCidaTableController> delegateTableController;
@end