//
//  Poi+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Poi+CoreDataProperties.h"

@implementation Poi (CoreDataProperties)

+ (NSFetchRequest<Poi *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Poi"];
}

@dynamic descripcion;
@dynamic email;
@dynamic idPoi;
@dynamic isActivo;
@dynamic latitud;
@dynamic longitud;
@dynamic telefono;
@dynamic tipoPoi;
@dynamic titulo;
@dynamic urlCompartir;
@dynamic urlImagen;
@dynamic urlWeb;
@dynamic listImagen;

@end
