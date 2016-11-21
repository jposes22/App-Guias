//
//  Constants.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Constants : NSObject


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4S (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 480.0)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 667.0)
#define IS_IPHONE_6PLUS (IS_IPHONE && [[UIScreen mainScreen] nativeScale] == 3.0f)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.width == 736.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

extern NSString *SETTINGS_WAS_STARTED_APP_BEFORE;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_PARAMETERS;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_MENU;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA_DETALLE_IMAGEN;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_GUIA_SABER_MAS_DETALLE_IMAGEN;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_POI;
extern NSString *SETTINGS_kDATE_LAST_UPDATE_IDIOMA;
extern NSString *SETTINGS_IDIOMA;

extern NSString * k_URL_UPDATE_SERVICE;

//* URL*/

extern NSString *const kURL_GET_PARAMETROS;
extern NSString *const kURL_GET_MENU;
extern NSString *const kURL_GET_IDIOMA;
extern NSString *const kURL_GET_NOVEDADES;
extern NSString *const kURL_GET_POIS;

extern NSString *const kURL_GET_GUIA;
extern NSString *const kURL_GET_GUIA_DETALLE;
extern NSString *const kURL_GET_GUIA_SABER_MAS;
extern NSString *const kURL_GET_GUIA_SABER_MAS_DETALLE;
extern NSString *const kURL_GET_IMAGE;

//NSNotifications

extern NSString *const kNOTIFICATION_GO_TO;
extern NSString *const kNOTIFICATION_GO_TO_SABER_MAS;


extern NSString * const kNOTIFICATION_UPDATE_MENU;

//Splash

extern double const k_NUMBER_DOWNLOADS_CHARGE;

//SEGUES

extern NSString * const kSEGUE_HOME;
extern NSString * const kSEGUE_POI;
extern NSString * const kSEGUE_LIST_POI;
extern NSString * const kSEGUE_POI_ARQUELOGICO;
extern NSString * const kSEGUE_SHOW_DETAIL;
extern NSString * const kSEGUE_LIST_POI_SINGLE;




@end
