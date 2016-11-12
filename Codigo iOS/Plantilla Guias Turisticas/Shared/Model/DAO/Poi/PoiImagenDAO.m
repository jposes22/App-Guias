//
//  PoiImagenDAO.m
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 12/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiImagenDAO.h"
#import "PoiDAO.h"
#import "CoreDataUtil.h"

@implementation PoiImagenDAO

+(PoiImagen *)getPoiImagen:(NSInteger *)idPoiImagen{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"PoiImagen" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idPoiImagen == %d", idPoiImagen];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem execute request: %@", [error localizedDescription]);
    }else{
        if(array.count > 0){
            return [array objectAtIndex:0];
        }
        
    }
    return nil;
}

+(void)insertarPoiImagen:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(PoiImagen *poiImagen in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PoiImagen"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idPoiImagen == %d", poiImagen.idPoiImagen]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            //Obtenemos el poi asociada
                      
        }else{
            [self updatePoiImagen:poiImagen];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
    
}


+(void)updatePoiImagen:(PoiImagen *)poiImagen{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"PoiImagen"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idPoiImagen == %d", poiImagen.idPoiImagen]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        PoiImagen * objectToModify = [array objectAtIndex:0];
        if(poiImagen.urlImagen){
            [objectToModify setValue:poiImagen.urlImagen forKey:@"urlImagen"];
        }
    }
}
@end



