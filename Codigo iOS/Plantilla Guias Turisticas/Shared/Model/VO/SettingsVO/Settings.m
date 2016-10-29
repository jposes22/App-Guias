//
//  Settings.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Settings.h"
#import "Constants.h"

@implementation Settings

+ (id)sharedInstance {
    static Settings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
-(id)init{
    if (self = [super init]) {
        self.wasStaredAppBefore = [[NSUserDefaults standardUserDefaults] boolForKey:SETTINGS_WAS_STARTED_APP_BEFORE];
        self.lastUpdatePoi =  [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_PARAMETERS];

        if(!_lastUpdatePoi){
            _lastUpdatePoi = @0;
        }
        self.lastUpdateGuia = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA];
        if(!_lastUpdateGuia){
            _lastUpdateGuia = @0;
        }
        self.lastUpdateGuiaDetalle = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE];
        if(!_lastUpdateGuiaDetalle){
            _lastUpdateGuiaDetalle = @0;
        }
        self.lastUpdateGuiaDetalleImagen = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE_IMAGEN];
        if(!_lastUpdateGuiaDetalleImagen){
            _lastUpdateGuiaDetalleImagen = @0;
        }
        self.lastUpdateGuiaSaberMas = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS];
        if(!_lastUpdateGuiaSaberMas){
            _lastUpdateGuiaSaberMas = @0;
        }
        self.lastUpdateGuiaSaberMasDetalle = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE];
        if(!_lastUpdateGuiaSaberMasDetalle){
            _lastUpdateGuiaSaberMasDetalle = @0;
        }
        self.lastUpdateGuiaDetalleSaberMasImagen= [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE_IMAGEN];
        if(!_lastUpdateGuiaDetalleSaberMasImagen){
            _lastUpdateGuiaDetalleSaberMasImagen = @0;
        }

        self.lastUpdateMenu = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_MENU];
        if(!_lastUpdateMenu){
            _lastUpdateMenu = @0;
        }
        self.lastUpdateParametros = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_PARAMETERS];
        if(!_lastUpdateParametros){
            _lastUpdateParametros = @0;
        }
        self.lastUpdateIdioma = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_kDATE_LAST_UPDATE_IDIOMA];
        if(!_lastUpdateIdioma){
            _lastUpdateIdioma = @0;
        }
        
        self.idioma = [[NSUserDefaults standardUserDefaults] objectForKey:SETTINGS_IDIOMA];


    }
    return self;
}

-(void)resetSettings{
    
    self.wasStaredAppBefore = NO;
    self.lastUpdateGuiaDetalleSaberMasImagen = @0;
    self.lastUpdateGuiaSaberMasDetalle = @0;
    self.lastUpdateGuiaSaberMas = @0;
    self.lastUpdateGuiaDetalleImagen = @0;
    self.lastUpdateGuiaDetalle = @0;
    self.lastUpdateGuia = @0;
    self.lastUpdatePoi = @0;
    self.lastUpdateMenu = @0;
    self.lastUpdateIdioma = @0;
    [self saveSettings];
    
    
}

-(void)saveSettings{
    [[NSUserDefaults standardUserDefaults] setBool:self.wasStaredAppBefore forKey:SETTINGS_WAS_STARTED_APP_BEFORE];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateParametros forKey:SETTINGS_kDATE_LAST_UPDATE_PARAMETERS];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdatePoi forKey:SETTINGS_kDATE_LAST_UPDATE_POI];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuia forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateMenu forKey:SETTINGS_kDATE_LAST_UPDATE_MENU];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateIdioma forKey:SETTINGS_kDATE_LAST_UPDATE_IDIOMA];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuiaDetalle forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuiaDetalleImagen forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE_IMAGEN];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuiaSaberMas forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuiaSaberMasDetalle forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE];
    [[NSUserDefaults standardUserDefaults] setObject:self.lastUpdateGuiaDetalleSaberMasImagen forKey:SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE_IMAGEN];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.idioma forKey:SETTINGS_IDIOMA];



    
}
@end
