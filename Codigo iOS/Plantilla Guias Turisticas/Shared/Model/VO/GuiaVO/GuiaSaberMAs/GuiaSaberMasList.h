//
//  GuiaSaberMasList.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaSaberMas+CoreDataProperties.h"

@interface GuiaSaberMasList : NSObject
@property (nonatomic, strong) NSString * titulo;
@property (nonatomic, strong) NSString * descripcion;
@property (nonatomic) double latitud;
@property (nonatomic) double longitud;
@property (nonatomic, strong) NSMutableArray * listOfGuiaDetalle;
@property (nonatomic, strong) NSString * urlAudioGuia;

+(GuiaSaberMasList *) getGuiaListObject:(GuiaSaberMas *)guia;

@end
