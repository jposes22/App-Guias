//
//  ParametrosApp+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ParametrosApp+CoreDataProperties.h"

@implementation ParametrosApp (CoreDataProperties)

+ (NSFetchRequest<ParametrosApp *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ParametrosApp"];
}

@dynamic clave;
@dynamic valor;
@dynamic isActivo;

@end
