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
    SideDrawerMenuItemCidaBorneiro     = 13,
    SideDrawerMenuItemPoi              = 3,
    SideDrawerMenuItemComoLlegar       = 4,
    SideDrawerMenuItemGaleria          = 5,
    SideDrawerMenuItemInformacion      = 6,
    SideDrawerMenuItemReferencias      = 7,
    SideDrawerMenuItemCopyright        = 8,
    SideDrawerMenuItemAjustes          = 9,
    SideDrawerMenuItemCreditos             = 11,
    SideDrawerMenuItemSelfie               = 12,
    SideDrawerMenuItemCulturaCastrenha      = 14,


    
};

//TIPOS GUIA
typedef NS_ENUM(NSInteger, kTipoGuia){
    kTipoGuiaVisit          = 0,
    kTipoGuiaCida           = 1,
    kTipoGuiaComoLlegar     = 2,
    kTipoGuiaCultura        = 3,
    kTipoGuiaReferencias            = 7,
    kTipoGuiaCopyright              = 8,

    
};

//TIPOS POI
typedef NS_ENUM(NSInteger, kTipoPoi){
    kTipoPoiPatrimonioArqueologico      = 0,
    kTipoPoiPatrimonioHistorico         = 1,
    kTipoPoiPoiRutasSenderismo          = 2,
    kTipoPoiPlayas                      = 3,
    kTipoPoiDirectorio                  = 4,
    kTipoPoiHoteleria                   = 5,
    kTipoFestas                         = 6,
};

@end
