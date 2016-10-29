//
//  Guia+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Guia+CoreDataProperties.h"

@implementation Guia (CoreDataProperties)

+ (NSFetchRequest<Guia *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Guia"];
}

@dynamic idGuia;
@dynamic isActivo;
@dynamic latitud;
@dynamic longitud;
@dynamic orden;
@dynamic tipoGuia;
@dynamic titulo;
@dynamic urlAudioGuia;
@dynamic descripcion;
@dynamic detalleGuia;

@end
