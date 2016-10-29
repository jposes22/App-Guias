//
//  RemotePoiVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemotePoiVO.h"
#import "RemoteConstants.h"
#import "Poi+CoreDataProperties.h"

@implementation RemotePoiVO

@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemotePoiVO *)initPoi:(id) jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            Poi * poi = [[Poi alloc] initPoiWithJson:json];
            [answere addObject:poi];
            
        }
    }
    return self;

}
@end
