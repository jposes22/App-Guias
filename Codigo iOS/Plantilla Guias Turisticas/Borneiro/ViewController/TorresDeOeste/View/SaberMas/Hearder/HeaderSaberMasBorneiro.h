//
//  HeaderSaberMas.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaSaberMasList.h"
@protocol ComunicationAudioGuiaSaberMas<NSObject>
@optional
- (void) playAudioGuia:(GuiaSaberMasList *)guia;
@end
@interface HeaderSaberMasBorneiro : UIView

- (void)loadData:(GuiaSaberMasList *)guia;
@property (nonatomic, weak) id<ComunicationAudioGuiaSaberMas> delegateAudioGuiaSaberMas;

@end
