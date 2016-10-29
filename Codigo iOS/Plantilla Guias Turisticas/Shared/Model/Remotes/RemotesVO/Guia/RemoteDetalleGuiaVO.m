//
//  RemoteDetalleGuiaVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteDetalleGuiaVO.h"
#import "RemoteConstants.h"
#import "GuiaDetalle+CoreDataProperties.h"

@implementation RemoteDetalleGuiaVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteDetalleGuiaVO *)initGuiaDetalle:(id)jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            GuiaDetalle * guiaDetalle = [[GuiaDetalle alloc] initGuiaDetaleWithJson:json];
            [answere addObject:guiaDetalle];
            
        }
    }
    return self;
    
}
@end
