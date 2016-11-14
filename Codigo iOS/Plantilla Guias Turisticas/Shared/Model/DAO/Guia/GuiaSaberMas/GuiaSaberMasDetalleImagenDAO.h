//
//  GuiaSaberMasDetalleImagenDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaSaberMasDetalleImagen+CoreDataProperties.h"
@interface GuiaSaberMasDetalleImagenDAO : NSObject
+(NSArray *)getGuiaSaberMasDetalleImagen:(NSInteger)idGuiaSaberMasDetalle;
+(void)insertarGuiaSaberMasDetalleImagen:(NSArray *)items;
@end
