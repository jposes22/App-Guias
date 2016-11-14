//
//  GuiaDetalleList.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleList.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaSaberMasDAO.h"
@interface GuiaDetalleList()

@end
@implementation GuiaDetalleList

-(id)initWithTitulo:(NSString *)titulo descripcion:(NSString *) descripcion idGuia:(NSInteger)idGuia{
    self = [super init];
    if (self) {
        self.idGuiaDetalle = idGuia;
        self.titulo = titulo;
        self.descripcion = descripcion;
    }
    return self;
}

+(GuiaDetalleList *)getGuiaDetalleData:(GuiaDetalle *)guiaDetalle{
    GuiaDetalleList * guiaDetalleList = [[GuiaDetalleList alloc] initWithTitulo:guiaDetalle.titulo descripcion:guiaDetalle.descripcion idGuia:guiaDetalle.idGuiaDetalle];
    //Obtenemos el listado de imagenes asociado  este objecto guia detalle

    NSArray * listSaberMas = [GuiaSaberMasDAO getGuiasSaberMas:guiaDetalle.idGuiaDetalle];

    if(listSaberMas != nil){
        guiaDetalleList.saberMasList = [listSaberMas firstObject];

    }
    NSArray *listObject = [GuiaDetalleImagenDAO getGuiaDetalleImagen:guiaDetalle.idGuiaDetalle];
    guiaDetalleList.listOfGuiaDetalleImagen = listObject;
    
    return guiaDetalleList;

}

@end
