//
//  Settings.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject
@property (atomic) BOOL wasStaredAppBefore;
@property (nullable, atomic, strong) NSNumber *lastUpdateParametros;
@property (nullable, atomic, strong) NSNumber *lastUpdateIdioma;

@property (nullable, atomic, strong) NSNumber *lastUpdateMenu;
@property (nullable, atomic, strong) NSNumber *lastUpdatePoi;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuia;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuiaDetalle;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuiaDetalleImagen;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuiaSaberMas;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuiaSaberMasDetalle;
@property (nullable, atomic, strong) NSNumber *lastUpdateGuiaDetalleSaberMasImagen;
@property (nonatomic) BOOL isPlaying;


@property (nullable, atomic, strong) NSString * idioma;

+(id)sharedInstance;
-(void) saveSettings;
-(void) resetSettings;
@end
