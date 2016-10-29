//
//  GuiaSaberMasDetalleImagen+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleImagen+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GuiaSaberMasDetalleImagen (CoreDataProperties)

+ (NSFetchRequest<GuiaSaberMasDetalleImagen *> *)fetchRequest;

@property (nonatomic) int64_t idGuiaSaberMAsDetalleImagen;
@property (nonatomic) int64_t idGuiaSaberMasDetalle;
@property (nullable, nonatomic, copy) NSString *urlImagen;
@property (nullable, nonatomic, retain) GuiaSaberMasDetalle *guiaSaberMasDetalle;

@end

NS_ASSUME_NONNULL_END
