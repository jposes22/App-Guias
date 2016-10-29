//
//  Idioma+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Idioma+CoreDataProperties.h"

@implementation Idioma (CoreDataProperties)

+ (NSFetchRequest<Idioma *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Idioma"];
}

@dynamic codigoIdioma;
@dynamic idIdioma;
@dynamic isActivo;
@dynamic nombreIdioma;

@end
