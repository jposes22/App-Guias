//
//  RemoteImageDetalleVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteImageDetalleVO.h"
#import "RemoteConstants.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"

@implementation RemoteImageDetalleVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteImageDetalleVO *)initGuiaDetalleImagen:(id)jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            GuiaDetalleImagen * guiaDetalleImagen = [[GuiaDetalleImagen alloc] initGuiaDetalleImagenWithJson:json];
            [answere addObject:guiaDetalleImagen];
            
        }
    }
    return self;
}
@end
