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
    
};

//TIPOS GUIA
typedef NS_ENUM(NSInteger, kTipoGuia){
    kTipoGuiaTorresOeste            = 0,
    kTipoGuiaRomeria                = 1,
    kTipoGuiaComoLlegar             = 2,
};

//TIPOS POI
typedef NS_ENUM(NSInteger, kTipoPoi){
    kTipoPoiRecursosPatrimoniales   = 0,
    kTipoPoiAlojamientos            = 1,
    kTipoPoiDirectorio              = 2,
    kTipoPoiRestauracion            = 3,
};
@end
