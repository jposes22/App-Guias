//
//  GuiaSaberMasDetalleDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaSaberMasDetalle+CoreDataProperties.h"

@interface GuiaSaberMasDetalleDAO : NSObject
+(NSArray *)getPGuiaSaberMAsDetalle:(NSInteger *)idGuia;
+(void)insertarGuiaSaberMasDetalle:(NSArray *)items;
+ (GuiaSaberMasDetalle *)getGuiaSaberMasDetalleById:(NSInteger) idGuiaSaberMas;
@end
