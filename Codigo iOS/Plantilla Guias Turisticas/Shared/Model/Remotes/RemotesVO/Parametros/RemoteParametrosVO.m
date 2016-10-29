//
//  RemoteParametrosVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteParametrosVO.h"
#import "RemoteConstants.h"
#import "ParametrosApp+CoreDataProperties.h"

@implementation RemoteParametrosVO

@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteParametrosVO *)initParametros:(id) jsonObject{
    
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        
        for (id json in answereArray) {
            ParametrosApp * parametros = [[ParametrosApp alloc] initTOParametrosWithJson:json];
            [answere addObject:parametros];
            
        }
        
    }
    return self;

}
@end
