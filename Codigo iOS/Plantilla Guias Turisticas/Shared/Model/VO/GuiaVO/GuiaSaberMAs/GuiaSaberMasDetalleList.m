//
//  GuiaSaberMasDetalleList.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleList.h"
#import "GuiaSaberMasDetalleImagenDAO.h"

@implementation GuiaSaberMasDetalleList

-(id)initWithTitulo:(NSString *)titulo descripcion:(NSString *) descripcion{
    self = [super init];
    if (self) {
        self.titulo = titulo;
        self.descripcion = descripcion;
    }
    return self;
}

+(GuiaSaberMasDetalleList *)getGuiaSaberMasDetalleData:(GuiaSaberMasDetalle *)guiaDetalle{
    GuiaSaberMasDetalleList * guiaDetalleList = [[GuiaSaberMasDetalleList alloc] initWithTitulo:guiaDetalle.titulo descripcion:guiaDetalle.descripcion];
    //Obtenemos el listado de imagenes asociado  este objecto guia detalle
    
    NSArray *listObject = [GuiaSaberMasDetalleImagenDAO getGuiaSaberMasDetalleImagen:guiaDetalle.idGuiaSaberMasDetalle];
    guiaDetalleList.listOfGuiaSaberMasDetalleImagen = listObject;
    return guiaDetalleList;
    
}

@end
