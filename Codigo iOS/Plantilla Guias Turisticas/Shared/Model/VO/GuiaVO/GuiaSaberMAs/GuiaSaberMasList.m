//
//  GuiaSaberMasList.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasList.h"
#import "GuiaSaberMasDetalleList.h"
#import "GuiaSaberMasDetalleDAO.h"
@implementation GuiaSaberMasList

- (instancetype)initWithTitulo:(NSString *)titulo andUrlAudioguia:(NSString *)url latitud:(double)latitud longitud:(double)longitud{
    self = [super init];
    if (self) {
        self.titulo = titulo;
        self.urlAudioGuia = url;
        self.listOfGuiaDetalle = [[NSMutableArray alloc] init];
        self.latitud = latitud;
        self.longitud = longitud;
    }
    return self;
}

+(GuiaSaberMasList *)getGuiaListObject:(GuiaSaberMas *)guia{
    GuiaSaberMasList * guiaList = [[GuiaSaberMasList alloc] initWithTitulo:guia.titulo andUrlAudioguia:guia.urlAudioGuia latitud:guia.latitud longitud:guia.longitud];
    NSArray *  listOfGuiaDetalle = [GuiaSaberMasDetalleDAO getPGuiaSaberMAsDetalle:guia.idGuiaSaberMas];
    for (GuiaSaberMasDetalle * guiaDetalle in listOfGuiaDetalle) {
        [ guiaList.listOfGuiaDetalle addObject:[ GuiaSaberMasDetalleList getGuiaSaberMasDetalleData:guiaDetalle]];
    }
    return guiaList;
    
}



@end
