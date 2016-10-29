//
//  GuiaDetalleImagenDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuiaDetalleImagenDAO : NSObject
+(NSArray *)getGuiaDetalleImagen:(NSInteger)idGuiaDetalleImagen;
+(void)insertarGuiaDetalleImagen:(NSArray *)items;
@end
