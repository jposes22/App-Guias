//
//  GuiaList.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaList.h"
#import "GuiaDetalleList.h"
#import "GuiaDetalleDAO.h"

@implementation GuiaList

- (instancetype)initWithTitulo:(NSString *)titulo andUrlAudioguia:(NSString *)url andDescripcion:(NSString*) descripcion{
    self = [super init];
    if (self) {
        self.titulo = titulo;
        self.descripcion = descripcion;
        self.urlAudioGuia = url;
        self.listOfGuiaDetalle = [[NSMutableArray alloc] init];
    }
    return self;
}

+(GuiaList *)getGuiaListObject:(Guia *)guia{
    GuiaList * guiaList = [[GuiaList alloc] initWithTitulo:guia.titulo andUrlAudioguia:guia.urlAudioGuia andDescripcion:guia.descripcion];
    NSArray *  listOfGuiaDetalle = [GuiaDetalleDAO getGuiaDetalleByIdGuia:guia.idGuia];
    for (GuiaDetalle * guiaDetalle in listOfGuiaDetalle) {
       [ guiaList.listOfGuiaDetalle addObject:[ GuiaDetalleList getGuiaDetalleData:guiaDetalle]];
    }
    return guiaList;
    
}

@end
