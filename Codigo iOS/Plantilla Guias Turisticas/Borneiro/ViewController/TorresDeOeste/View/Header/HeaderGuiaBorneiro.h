//
//  HeaderGuiaBorneiro.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol ComunicationAudioGuiaBorneiro<NSObject>
@optional
- (void) playAudioGuia:(GuiaList *)guia;
@end
@interface HeaderGuiaBorneiro : UIView

- (void)loadData:(GuiaList *)guia;
@property (nonatomic, weak) id<ComunicationAudioGuiaBorneiro> delegateAudioGuia;
@end
