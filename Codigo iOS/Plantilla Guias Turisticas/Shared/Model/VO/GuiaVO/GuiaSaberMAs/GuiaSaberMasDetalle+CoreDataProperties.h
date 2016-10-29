//
//  GuiaSaberMasDetalle+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalle+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GuiaSaberMasDetalle (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMasDetalle *> *)fetchRequest;

@property (nonatomic) int64_t idGuiaSaberMasDetalle;
@property (nonatomic) int64_t idGuiaSaberMas;
@property (nonatomic) int16_t orden;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nullable, nonatomic, copy) NSString *descripcion;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nullable, nonatomic, retain) GuiaSaberMas *guiaSaberMas;
@property (nullable, nonatomic, retain) GuiaSaberMasDetalleImagen *guiaSaberMasDetalleImagen;

@end

NS_ASSUME_NONNULL_END
