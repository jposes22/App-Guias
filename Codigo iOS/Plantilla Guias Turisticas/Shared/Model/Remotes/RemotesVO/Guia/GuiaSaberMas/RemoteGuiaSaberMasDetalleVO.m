//
//  RemoteGuiaSaberMasDetalleVO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaSaberMasDetalleVO.h"
#import "RemoteConstants.h"
#import "GuiaSaberMasDetalle+CoreDataProperties.h"

@implementation RemoteGuiaSaberMasDetalleVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteGuiaSaberMasDetalleVO *)initGuiaSaberMasDetalle:(id)jsonObject{
    if(self = [super init]){
        answere = [[NSMutableArray alloc] init];
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            GuiaSaberMasDetalle * guiaSaberMasDetalle = [[GuiaSaberMasDetalle alloc] initGuiaSaberMasDetaleWithJson:json];
            [answere addObject:guiaSaberMasDetalle];
            
        }
    }
    return self;
}

@end
