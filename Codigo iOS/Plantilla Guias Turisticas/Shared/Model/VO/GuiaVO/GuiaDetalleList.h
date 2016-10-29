//
//  GuiaDetalleList.h
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaDetalle+CoreDataProperties.h"

@interface GuiaDetalleList : NSObject
@property (nonatomic, strong) NSString * titulo;
@property (nonatomic, strong) NSString * descripcion;
@property (nonatomic, strong) NSArray * listOfGuiaDetalleImagen;

+(GuiaDetalleList *)getGuiaDetalleData:(GuiaDetalle *)guiaDetalle;

@end
