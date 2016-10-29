//
//  GuiaDetalle+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalle+CoreDataClass.h"
@class Guia;

NS_ASSUME_NONNULL_BEGIN

@interface GuiaDetalle (CoreDataProperties)

+ (NSFetchRequest<GuiaDetalle *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *descripcion;
@property (nonatomic) int64_t idGuia;
@property (nonatomic) int64_t idGuiaDetalle;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) int16_t orden;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nullable, nonatomic, retain) Guia *guia;
@property (nullable, nonatomic, retain) NSSet<GuiaDetalleImagen *> *imagenesDetalle;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *listGuiaSaberMas;

@end

@interface GuiaDetalle (CoreDataGeneratedAccessors)

- (void)addImagenesDetalleObject:(GuiaDetalleImagen *)value;
- (void)removeImagenesDetalleObject:(GuiaDetalleImagen *)value;
- (void)addImagenesDetalle:(NSSet<GuiaDetalleImagen *> *)values;
- (void)removeImagenesDetalle:(NSSet<GuiaDetalleImagen *> *)values;

- (void)addListGuiaSaberMasObject:(NSManagedObject *)value;
- (void)removeListGuiaSaberMasObject:(NSManagedObject *)value;
- (void)addListGuiaSaberMas:(NSSet<NSManagedObject *> *)values;
- (void)removeListGuiaSaberMas:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
