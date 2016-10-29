//
//  RemoteGuiaVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaVO.h"
#import "RemoteConstants.h"
#import "Guia+CoreDataProperties.h"


@implementation RemoteGuiaVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteGuiaVO *)initGuia:(id)jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            Guia * guia = [[Guia alloc] initGuiaWithJson:json];
            [answere addObject:guia];
            
        }
    }
    return self;
    
}
@end
