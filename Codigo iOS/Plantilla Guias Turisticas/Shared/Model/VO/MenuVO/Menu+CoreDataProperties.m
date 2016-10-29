//
//  Menu+CoreDataProperties.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Menu+CoreDataProperties.h"

@implementation Menu (CoreDataProperties)

+ (NSFetchRequest<Menu *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Menu"];
}

@dynamic codeMenu;
@dynamic idMenu;
@dynamic isActivo;
@dynamic orden;

@end
