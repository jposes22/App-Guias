//
//  GuiaSaberMas+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMas+CoreDataProperties.h"

@implementation GuiaSaberMas (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMas *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMas"];
}

@dynamic idGuiaSaberMas;
@dynamic idGuiaDetalle;
@dynamic titulo;
@dynamic isActivo;
@dynamic latitud;
@dynamic longitud;
@dynamic urlAudioGuia;
@dynamic guiaDetalle;
@dynamic listGuiaSaberMasDetalle;

@end
