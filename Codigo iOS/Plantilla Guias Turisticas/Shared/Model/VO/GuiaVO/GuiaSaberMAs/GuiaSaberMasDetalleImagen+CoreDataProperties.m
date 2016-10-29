//
//  GuiaSaberMasDetalleImagen+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleImagen+CoreDataProperties.h"

@implementation GuiaSaberMasDetalleImagen (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMasDetalleImagen *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMasDetalleImagen"];
}

@dynamic idGuiaSaberMAsDetalleImagen;
@dynamic idGuiaSaberMasDetalle;
@dynamic urlImagen;
@dynamic guiaSaberMasDetalle;

@end
