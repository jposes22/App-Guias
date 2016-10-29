//
//  PoiImagen+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiImagen+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PoiImagen (CoreDataProperties)

+ (NSFetchRequest<PoiImagen *> *)fetchRequest;

@property (nonatomic) int64_t idPoiImagen;
@property (nonatomic) int64_t idPoi;
@property (nullable, nonatomic, copy) NSString *urlImagen;
@property (nullable, nonatomic, retain) Poi *poi;

@end

NS_ASSUME_NONNULL_END
