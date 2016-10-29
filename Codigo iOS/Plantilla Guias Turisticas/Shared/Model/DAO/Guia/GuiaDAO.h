//
//  GuiaDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guia+CoreDataProperties.h"

@interface GuiaDAO : NSObject
+(NSArray *)getGuiasByTipo:(NSInteger)tipoGuia;
+(void)insertarGuias:(NSArray *)items;
+(Guia *) getGuiaById:(NSInteger)idGuia;
@end
