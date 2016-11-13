//
//  GuiaSaberMasDetalleList.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaSaberMasDetalle+CoreDataProperties.h"

@interface GuiaSaberMasDetalleList : NSObject
@property (nonatomic, strong) NSString * titulo;
@property (nonatomic, strong) NSString * descripcion;
@property (nonatomic, strong) NSArray * listOfGuiaSaberMasDetalleImagen;

+(GuiaSaberMasDetalleList *)getGuiaSaberMasDetalleData:(GuiaSaberMasDetalle *)guiaSaberMasDetalle;
@end
