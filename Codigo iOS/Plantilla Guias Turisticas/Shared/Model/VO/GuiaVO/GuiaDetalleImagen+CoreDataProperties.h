//
//  GuiaDetalleImagen+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleImagen+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GuiaDetalleImagen (CoreDataProperties)

+ (NSFetchRequest<GuiaDetalleImagen *> *)fetchRequest;

@property (nonatomic) int64_t idGuiaDetalle;
@property (nonatomic) int64_t idGuiaDetalleImagen;
@property (nullable, nonatomic, copy) NSString *urlImagen;
@property (nullable, nonatomic, retain) GuiaDetalle *detalleGuia;

@end

NS_ASSUME_NONNULL_END
