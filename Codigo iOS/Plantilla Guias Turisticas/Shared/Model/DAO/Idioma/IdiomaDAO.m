//
//  IdiomaDAO.m
//  TorresDeOeste
//
//  Created by Evelb on 14/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "IdiomaDAO.h"
#import "CoreDataUtil.h"
#import "Idioma+CoreDataClass.h"
@implementation IdiomaDAO
+(NSArray *)getIdiomas{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Idioma" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"isActivo == YES"];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    //Ejecutamos la consulta
    NSArray *array = [context executeFetchRequest:request error:&error];
    if (array == nil){
        NSLog(@"Problem execute request: %@", [error localizedDescription]);
    }else{
        return array;
    }
    return nil;

}
+(void)insertarIdiomas:(NSArray *)idiomas{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(Idioma *item in idiomas){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Idioma"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idIdioma == %d", item.idIdioma]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:item];
        }else{
            [self updateItemIdioma:item];
        }
    }
   // dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
   // });
}

+(void)updateItemIdioma:(Idioma *)item{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"Idioma"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idIdioma == %d", item.idIdioma]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        Idioma * objectToModify = [array objectAtIndex:0];
        [objectToModify setValue:item.codigoIdioma forKey:@"codigoIdioma"];
        [objectToModify setValue:[NSNumber numberWithBool:item.isActivo] forKey:@"isActivo"];
        [objectToModify setValue:item.nombreIdioma forKey:@"nombreIdioma"];

        
    }
}

@end
