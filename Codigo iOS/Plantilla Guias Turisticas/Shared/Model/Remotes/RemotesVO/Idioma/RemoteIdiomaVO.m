//
//  RemoteIdiomaVO.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteIdiomaVO.h"
#import "RemoteConstants.h"
#import "Idioma+CoreDataClass.h"

@implementation RemoteIdiomaVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;
-(RemoteIdiomaVO *)initRemoteIdioma:(id) jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        
        for (id json in answereArray) {
            Idioma * idioma = [[Idioma alloc] initIdiomaWithJson:json];
            [answere addObject:idioma];
            
        }
        
    }
    return self;

}

@end
