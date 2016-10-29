//
//  RemoteGuiaSaberMasDetalleImagenVO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaSaberMasDetalleImagenVO.h"
#import "RemoteConstants.h"
#import "GuiaSaberMasDetalleImagen+CoreDataProperties.h"
@implementation RemoteGuiaSaberMasDetalleImagenVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteGuiaSaberMasDetalleImagenVO *)initGuiaSaberMasDetalleImagen:(id)jsonObject{
    if(self = [super init]){
        answere = [[NSMutableArray alloc] init];
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            GuiaSaberMasDetalleImagen * guiaSaberMasDetalleImagen = [[GuiaSaberMasDetalleImagen alloc] initGuiaDetalleImagenWithJson:json];
            [answere addObject:guiaSaberMasDetalleImagen];
        }
    }
    return self;
}

@end
