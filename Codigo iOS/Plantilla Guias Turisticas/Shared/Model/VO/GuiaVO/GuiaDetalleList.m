//
//  GuiaDetalleList.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleList.h"
#import "GuiaDetalleImagenDAO.h"
@interface GuiaDetalleList()

@end
@implementation GuiaDetalleList

-(id)initWithTitulo:(NSString *)titulo descripcion:(NSString *) descripcion{
    self = [super init];
    if (self) {
        self.titulo = titulo;
        self.descripcion = descripcion;
    }
    return self;
}

+(GuiaDetalleList *)getGuiaDetalleData:(GuiaDetalle *)guiaDetalle{
    GuiaDetalleList * guiaDetalleList = [[GuiaDetalleList alloc] initWithTitulo:guiaDetalle.titulo descripcion:guiaDetalle.descripcion];
    //Obtenemos el listado de imagenes asociado  este objecto guia detalle
    
    NSArray *listObject = [GuiaDetalleImagenDAO getGuiaDetalleImagen:guiaDetalle.idGuiaDetalle];
    guiaDetalleList.listOfGuiaDetalleImagen = listObject;
    
    return guiaDetalleList;

}

@end
