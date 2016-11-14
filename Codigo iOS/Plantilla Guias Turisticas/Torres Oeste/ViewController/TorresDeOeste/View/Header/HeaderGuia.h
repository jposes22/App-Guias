//
//  HeaderGuia.h
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaList.h"
@protocol ComunicationAudioGuia<NSObject>
@optional
- (void) playAudioGuia:(GuiaList *)guia;
@end
@interface HeaderGuia : UIView
- (void)loadData:(GuiaList *)guia;
@property (nonatomic, weak) id<ComunicationAudioGuia> delegateAudioGuia;
@end
