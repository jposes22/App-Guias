//
//  Guia+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Guia+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Guia (CoreDataProperties)

+ (NSFetchRequest<Guia *> *)fetchRequest;

@property (nonatomic) int64_t idGuia;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nonatomic) int16_t orden;
@property (nonatomic) int16_t tipoGuia;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nullable, nonatomic, copy) NSString *urlAudioGuia;
@property (nullable, nonatomic, copy) NSString *descripcion;
@property (nullable, nonatomic, retain) NSSet<GuiaDetalle *> *detalleGuia;

@end

@interface Guia (CoreDataGeneratedAccessors)

- (void)addDetalleGuiaObject:(GuiaDetalle *)value;
- (void)removeDetalleGuiaObject:(GuiaDetalle *)value;
- (void)addDetalleGuia:(NSSet<GuiaDetalle *> *)values;
- (void)removeDetalleGuia:(NSSet<GuiaDetalle *> *)values;

@end

NS_ASSUME_NONNULL_END
