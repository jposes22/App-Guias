//
//  Idioma+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Idioma+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Idioma (CoreDataProperties)

+ (NSFetchRequest<Idioma *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *codigoIdioma;
@property (nonatomic) int32_t idIdioma;
@property (nonatomic) BOOL isActivo;
@property (nullable, nonatomic, copy) NSString *nombreIdioma;

@end

NS_ASSUME_NONNULL_END
