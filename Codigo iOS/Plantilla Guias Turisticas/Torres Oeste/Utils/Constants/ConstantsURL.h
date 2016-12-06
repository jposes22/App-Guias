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


//*MENU *//

typedef NS_ENUM(NSInteger, SideDrawerMenuItem) {
    SideDrawerMenuItemHome             = 0,
    SideDrawerMenuItemGuia             = 1,
    SideDrawerMenuItemRomeria          = 2,
    SideDrawerMenuItemPoi              = 3,
    SideDrawerMenuItemComoLlegar       = 4,
    SideDrawerMenuItemGaleria          = 5,
    SideDrawerMenuItemInformacion      = 6,
    SideDrawerMenuItemReferencias      = 7,
    SideDrawerMenuItemCopyright        = 8,
    SideDrawerMenuItemAjustes          = 9,
    SideDrawerMenuReconstruccion3D     = 10,
    SideDrawerMenuCreditos             = 11,
    SideDrawerMenuSelfie               = 16,
    
};

//TIPOS GUIA
typedef NS_ENUM(NSInteger, kTipoGuia){
    kTipoGuiaTorresOeste            = 0,
    kTipoGuiaRomeria                = 1,
    kTipoGuiaComoLlegar             = 2,
    kTipoGuiaReferencias            = 7,
    kTipoGuiaCopyright              = 8,
};

//TIPOS POI
typedef NS_ENUM(NSInteger, kTipoPoi){
    kTipoPoiPetroglifos   = 0,
    kTipoMolinos          = 1,
    kTipoRutas            = 2,
    kTipoLaguna           = 3,
    
    kTipoALojamiento      = 4,
    kTipoRestaurante      = 5,
    kTIpoTelefonos        = 6,
};
@end
