//
//  ParametrosRepositorio.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ParametrosRepositorio.h"
#import "Constants.h"
#import "ParametrosDAO.h"
#import "ParametrosApp+CoreDataClass.h"

@implementation ParametrosRepositorio
//function to save constantes in BD before do nothing in app
//after this the app will update all values and save in bd again.
+(BOOL) saveParametersInBD{
    
    NSMutableArray  *parameters = [[NSMutableArray alloc] init];
    
    ParametrosApp *parameterUrlUpdateService = [[ParametrosApp alloc] initWithKey:k_URL_UPDATE_SERVICE value:kURL_SERVICE activo:YES];
    
    [parameters addObject:parameterUrlUpdateService];
    
    [ParametrosDAO insertarParametros:parameters];
    return YES;
}

//Always must only get parameter with constants key

//functions to get String (database) parameter for key
+(NSString*) getParameterString:(NSString*) key{
    return  [ParametrosDAO getValueForKey:key];
}
//functions to get Integer (database) parameter for key
+(NSInteger) getParameterInteger: (NSString*) key{
    return [[ParametrosDAO getValueForKey:key] integerValue];
}
//functions to get number (database) parameter for key
+(NSNumber *) getParameterNumber: (NSString*) key{
    return [NSNumber numberWithLongLong:[[ParametrosDAO getValueForKey:key] longLongValue]];
}

@end
