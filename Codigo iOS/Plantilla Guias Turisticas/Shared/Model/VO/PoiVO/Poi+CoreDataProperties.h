//
//  Poi+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Poi+CoreDataClass.h"

@class PoiImagen;
NS_ASSUME_NONNULL_BEGIN

@interface Poi (CoreDataProperties)

+ (NSFetchRequest<Poi *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *descripcion;
@property (nullable, nonatomic, copy) NSString *email;
@property (nonatomic) int64_t idPoi;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nullable, nonatomic, copy) NSString *telefono;
@property (nonatomic) int16_t tipoPoi;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nullable, nonatomic, copy) NSString *urlCompartir;
@property (nullable, nonatomic, copy) NSString *urlImagen;
@property (nullable, nonatomic, copy) NSString *urlWeb;
@property (nullable, nonatomic, retain) NSSet<PoiImagen *> *listImagen;

@end

@interface Poi (CoreDataGeneratedAccessors)

- (void)addListImagenObject:(PoiImagen *)value;
- (void)removeListImagenObject:(PoiImagen *)value;
- (void)addListImagen:(NSSet<PoiImagen *> *)values;
- (void)removeListImagen:(NSSet<PoiImagen *> *)values;

@end

NS_ASSUME_NONNULL_END
