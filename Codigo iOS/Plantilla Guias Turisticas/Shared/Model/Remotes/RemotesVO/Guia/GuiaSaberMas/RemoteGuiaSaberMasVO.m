//
//  RemoteGuiaSaberMasVO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaSaberMasVO.h"
#import "RemoteConstants.h"
#import "GuiaSaberMas+CoreDataProperties.h"

@implementation RemoteGuiaSaberMasVO
@synthesize dateFrom;
@synthesize dateTo;
@synthesize answere;

-(RemoteGuiaSaberMasVO *)initGuiaSaberMas:(id)jsonObject{
    if(self = [super init]){
        dateFrom = [jsonObject objectForKey:kREMOTE_VO_DATE_FROM];
        dateTo = [jsonObject objectForKey:kREMOTE_VO_DATE_TO];
        answere = [[NSMutableArray alloc] init];
        id answereArray = [jsonObject objectForKey:kREMOTE_VO_ANSWERE];
        for (id json in answereArray) {
            GuiaSaberMas * guiaSaberMas = [[GuiaSaberMas alloc] initGuiaSaberMasWithJson:json];
            [answere addObject:guiaSaberMas];
            
        }
    }
    return self;
}


@end
