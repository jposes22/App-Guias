//
//  GuiaSaberMas+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMas+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GuiaSaberMas (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMas *> *)fetchRequest;

@property (nonatomic) int64_t idGuiaSaberMas;
@property (nonatomic) int64_t idGuiaDetalle;
@property (nullable, nonatomic, copy) NSString *titulo;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nullable, nonatomic, copy) NSString *urlAudioGuia;
@property (nullable, nonatomic, retain) GuiaDetalle *guiaDetalle;
@property (nullable, nonatomic, retain) NSSet<GuiaSaberMasDetalle *> *listGuiaSaberMasDetalle;

@end

@interface GuiaSaberMas (CoreDataGeneratedAccessors)

- (void)addListGuiaSaberMasDetalleObject:(GuiaSaberMasDetalle *)value;
- (void)removeListGuiaSaberMasDetalleObject:(GuiaSaberMasDetalle *)value;
- (void)addListGuiaSaberMasDetalle:(NSSet<GuiaSaberMasDetalle *> *)values;
- (void)removeListGuiaSaberMasDetalle:(NSSet<GuiaSaberMasDetalle *> *)values;

@end

NS_ASSUME_NONNULL_END
