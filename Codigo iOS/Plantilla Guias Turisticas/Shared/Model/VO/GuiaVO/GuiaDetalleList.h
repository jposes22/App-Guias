//
//  GuiaDetalleList.h
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaDetalle+CoreDataProperties.h"
#import "GuiaSaberMasList.h"

@interface GuiaDetalleList : NSObject
@property (nonatomic, strong) NSString * titulo;
@property (nonatomic) NSInteger idGuiaDetalle;
@property (nonatomic, strong) NSString * descripcion;
@property (nonatomic, strong) NSArray * listOfGuiaDetalleImagen;
@property (nonatomic, strong) GuiaSaberMasList * saberMasList;
+(GuiaDetalleList *)getGuiaDetalleData:(GuiaDetalle *)guiaDetalle;

@end
