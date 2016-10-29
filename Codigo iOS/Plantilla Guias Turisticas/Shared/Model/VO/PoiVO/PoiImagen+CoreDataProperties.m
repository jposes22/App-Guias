//
//  PoiImagen+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiImagen+CoreDataProperties.h"

@implementation PoiImagen (CoreDataProperties)

+ (NSFetchRequest<PoiImagen *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PoiImagen"];
}

@dynamic idPoiImagen;
@dynamic idPoi;
@dynamic urlImagen;
@dynamic poi;

@end
