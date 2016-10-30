//
//  HeaderGuia.h
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol ComunicationCulturaAudioGuia<NSObject>
@optional
- (void) playAudioGuia:(GuiaList *)guia;
@end
@interface HeaderCultura : UIView

- (void)loadData:(GuiaList *)guia;
@property (nonatomic, weak) id<ComunicationCulturaAudioGuia> delegateAudioGuia;
@end
