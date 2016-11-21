//
//  Constants.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConstantsURL : NSObject
//* URL*/

extern NSString *const kURL_SERVICE;

//* MENU *//
typedef NS_ENUM(NSInteger, SideDrawerMenuItem) {
    SideDrawerMenuItemHome             = 0,
    SideDrawerMenuItemGuia             = 1,
    SideDrawerMenuItemPoi              = 3,
    SideDrawerMenuItemComoLlegar       = 4,
    SideDrawerMenuItemGaleria          = 5,
    SideDrawerMenuItemReferencias      = 7,
    SideDrawerMenuItemCopyright        = 8,
    SideDrawerMenuItemAjustes          = 9,
    SideDrawerMenuReconstruccion3D     = 10,
    SideDrawerMenuCreditos             = 11,
    
};

//TIPOS GUIA
typedef NS_ENUM(NSInteger, kTipoGuia){
    kTipoGuiaCastroBaronha          = 0,
    kTipoGuiaComoLlegar             = 2,
    kTipoGuiaReferencias            = 7,
    kTipoGuiaCopyright              = 8,

};

//TIPOS POI
typedef NS_ENUM(NSInteger, kTipoPoi){
    kTipoPoiPetroglifos             = 0,
    kTipoPoiCastroQueiruga          = 1,
    kTipoPoiPraiaCoido              = 2,
    kTipoPoiArealonga               = 3,
    
};

@end
