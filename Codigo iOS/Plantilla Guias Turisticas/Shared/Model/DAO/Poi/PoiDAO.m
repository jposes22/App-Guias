//
//  PoiDAO.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiDAO.h"
#import "CoreDataUtil.h"

@implementation PoiDAO


+(Poi *)getPoi:(NSInteger *)idPoi{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Poi" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idPoi == %d", idPoi];
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


+(NSArray *)getPoiByCategory:(NSInteger )category{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Poi" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"tipoPoi == %d", category];
    NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"titulo" ascending:YES];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    [request setSortDescriptors:[[NSArray alloc] initWithObjects:sort, nil]];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem execute request: %@", [error localizedDescription]);
    }else{
        return array;
    }
    return nil;

}
+(void)insertarPoi:(NSArray *)listOfPoi{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(Poi *poi in listOfPoi){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Poi"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idPoi == %d", poi.idPoi]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:poi];
        }else{
            [self updatePoi:poi];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
}

+(void)updatePoi:(Poi *)poi{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"Poi"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idPoi == %d", poi.idPoi]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        Poi * objectToModify = [array objectAtIndex:0];
        if(poi.titulo){
            [objectToModify setValue:poi.titulo forKey:@"titulo"];
        }
        if(poi.descripcion){
            [objectToModify setValue:poi.descripcion forKey:@"descripcion"];
        }
        if(poi.urlImagen){
            [objectToModify setValue:poi.urlImagen forKey:@"urlImagen"];
        }
        if(poi.urlWeb){
            [objectToModify setValue:poi.urlWeb forKey:@"urlWeb"];
        }
        if(poi.urlCompartir){
            [objectToModify setValue:poi.urlCompartir forKey:@"urlCompartir"];
        }
        if(poi.email){
            [objectToModify setValue:poi.email forKey:@"email"];
        }
        
        if(poi.telefono){
            [objectToModify setValue:poi.telefono forKey:@"telefono"];
        }
       
        [objectToModify setValue:[NSNumber numberWithInt:poi.tipoPoi] forKey:@"tipoPoi"];
        [objectToModify setValue:[NSNumber numberWithBool:poi.isActivo] forKey:@"isActivo"];
        [objectToModify setValue:[NSNumber numberWithDouble:poi.latitud] forKey:@"latitud"];
        [objectToModify setValue:[NSNumber numberWithDouble:poi.longitud] forKey:@"longitud"];

    }
}

@end
