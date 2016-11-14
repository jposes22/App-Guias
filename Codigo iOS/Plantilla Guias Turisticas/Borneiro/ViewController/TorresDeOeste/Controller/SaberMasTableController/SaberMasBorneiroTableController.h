//
//  SaberMasTableController.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GuiaSaberMasList.h"
@protocol CommunicationSaberMasBorneiroTableController <NSObject>
@optional

- (void)communicationImageSelected:(NSArray *)list;
- (void)comunicationPlayAudioGuia:(GuiaSaberMasList *)guia;

@end

@interface SaberMasBorneiroTableController : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * listOfDetalleGuia;
@property (nonatomic, strong) GuiaSaberMasList * guia;

@property (nonatomic, weak) id<CommunicationSaberMasBorneiroTableController> delegateTableController;
@end


