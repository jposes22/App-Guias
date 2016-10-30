//
//  HeaderGuia.h
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol ComunicationCidaAudioGuia<NSObject>
@optional
- (void) playAudioGuia:(GuiaList *)guia;
@end
@interface HeaderCida : UIView

- (void)loadData:(GuiaList *)guia;
@property (nonatomic, weak) id<ComunicationCidaAudioGuia> delegateAudioGuia;
@end
