//
//  RemoteMenuVO.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteMenuVO.h"
#import "RemoteConstants.h"
#import "Menu+CoreDataClass.h"

@implementation RemoteMenuVO

@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteMenuVO *)initMenu:(id) jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        
        for (id json in answereArray) {
            Menu * menu = [[Menu alloc] initToMenuWithJson:json];
            [answere addObject:menu];
            
        }
        
    }
    return self;
}
@end
