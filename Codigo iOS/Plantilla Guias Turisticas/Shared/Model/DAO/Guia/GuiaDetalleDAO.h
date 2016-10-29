//
//  GuiaDetalleDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaDetalle+CoreDataProperties.h"
@interface GuiaDetalleDAO : NSObject
+(NSArray *)getGuiaDetalleByIdGuia:(NSInteger)idGuia;
+(void)insertarGuiaDetalle:(NSArray *)items;
+ (GuiaDetalle *)getGuiaDetalleById:(NSInteger) idGuiaDetalle;
@end
