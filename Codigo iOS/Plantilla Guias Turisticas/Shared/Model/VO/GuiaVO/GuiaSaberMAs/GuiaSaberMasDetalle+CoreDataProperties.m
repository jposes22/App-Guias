//
//  GuiaSaberMasDetalle+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalle+CoreDataProperties.h"

@implementation GuiaSaberMasDetalle (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMasDetalle *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMasDetalle"];
}

@dynamic idGuiaSaberMasDetalle;
@dynamic idGuiaSaberMas;
@dynamic orden;
@dynamic titulo;
@dynamic descripcion;
@dynamic isActivo;
@dynamic latitud;
@dynamic longitud;
@dynamic guiaSaberMas;
@dynamic guiaSaberMasDetalleImagen;

@end
