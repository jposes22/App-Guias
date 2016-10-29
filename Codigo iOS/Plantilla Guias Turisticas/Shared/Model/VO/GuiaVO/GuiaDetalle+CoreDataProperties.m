//
//  GuiaDetalle+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalle+CoreDataProperties.h"

@implementation GuiaDetalle (CoreDataProperties)

+ (NSFetchRequest<GuiaDetalle *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GuiaDetalle"];
}

@dynamic descripcion;
@dynamic idGuia;
@dynamic idGuiaDetalle;
@dynamic isActivo;
@dynamic orden;
@dynamic titulo;
@dynamic latitud;
@dynamic longitud;
@dynamic guia;
@dynamic imagenesDetalle;
@dynamic listGuiaSaberMas;

@end
