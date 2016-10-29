//
//  GuiaDetalleImagen+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleImagen+CoreDataProperties.h"

@implementation GuiaDetalleImagen (CoreDataProperties)

+ (NSFetchRequest<GuiaDetalleImagen *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GuiaDetalleImagen"];
}

@dynamic idGuiaDetalle;
@dynamic idGuiaDetalleImagen;
@dynamic urlImagen;
@dynamic detalleGuia;

@end
