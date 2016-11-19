//
//  ParametrosDAO.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ParametrosDAO.h"
#import "CoreDataUtil.h"
#import "Constants.h"

@implementation ParametrosDAO
#pragma mark -- list of Application
+(NSDictionary *)getParametros{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"ParametrosApp" inManagedObjectContext:context];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem execute request: %@", [error localizedDescription]);
    }else{
        for (ParametrosApp *parameter in array) {
            [parameters setValue:parameter.valor forKey:parameter.clave];
        }
        return parameters;
    }
    return nil;
}

+(void)insertarParametros:(NSArray *)parameters{
    //Check if the app is in
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(ParametrosApp *parametro in parameters){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ParametrosApp"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"clave == %@", parametro.clave]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:parametro];
        }else{
            [self updateParameter:parametro];
        }
    }
  //  dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
  //  });
}
+(void)updateParameter:(ParametrosApp *)parametro{
    NSError *error;
    if(![parametro.clave isEqualToString:k_URL_UPDATE_SERVICE]){
        NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
        NSBatchUpdateRequest *req = [[NSBatchUpdateRequest alloc] initWithEntityName:@"ParametrosApp"];
        req.predicate = [NSPredicate predicateWithFormat:@"clave == %@", parametro.clave];
        req.propertiesToUpdate = @{
                                   @"valor" : parametro.valor
                                   };
        req.resultType = NSUpdatedObjectsCountResultType;
        [context executeRequest:req error:nil];
        
    }
    
    [[CoreDataUtil instancia] saveContext:&error];
}
+(ParametrosApp *)getParametroByKey:(NSString *)key{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"ParametrosApp" inManagedObjectContext:context];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"clave == %@",key];
    [request setPredicate:predicate];
    
    [request setEntity:entityDescription];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    }else{
        if([array count] > 0){
            return (ParametrosApp *) [array objectAtIndex:0];
        }
    }
    return nil;
    
}

+(NSString *)getValueForKey:(NSString *)key{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"ParametrosApp" inManagedObjectContext:context];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ParametrosApp"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"clave == %@", key]];
    
    [request setEntity:entityDescription];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    }else{
        if([array count] > 0){
            ParametrosApp *parameter = [array objectAtIndex:0];
            return  [parameter valor];
        }
    }
    return nil;
    
}

@end
