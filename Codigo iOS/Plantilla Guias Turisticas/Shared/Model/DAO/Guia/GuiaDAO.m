//
//  GuiaDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDAO.h"
#import "CoreDataUtil.h"
#import "GuiaList.h"


@implementation GuiaDAO
+(NSArray *)getGuiasByTipo:(NSInteger)tipoGuia{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Guia" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"isActivo == YES AND tipoGuia == %d", tipoGuia];
    NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"orden" ascending:YES];
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
        NSMutableArray * listado = [[NSMutableArray alloc] init];
        for (Guia * guia  in array) {
            [listado addObject: [GuiaList getGuiaListObject:guia]];
        }
        return listado;
    }
    return nil;

}
+(void)insertarGuias:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(Guia *guia in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Guia"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuia == %d", guia.idGuia]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:guia];
        }else{
            [self updatePoi:guia];
        }
    }
   // dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
   // });
}
+(void)updatePoi:(Guia *)guia{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"Guia"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idGuia == %d", guia.idGuia]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        Guia * objectToModify = [array objectAtIndex:0];
        if(guia.titulo){
            [objectToModify setValue:guia.titulo forKey:@"titulo"];
        }
        if(guia.urlAudioGuia){
            [objectToModify setValue:guia.urlAudioGuia forKey:@"urlAudioGuia"];
        }
        [objectToModify setValue:[NSNumber numberWithInteger:guia.orden] forKey:@"orden"];
        [objectToModify setValue:[NSNumber numberWithBool:guia.isActivo] forKey:@"isActivo"];
        [objectToModify setValue:[NSNumber numberWithDouble:guia.latitud] forKey:@"latitud"];
        [objectToModify setValue:[NSNumber numberWithDouble:guia.longitud] forKey:@"longitud"];
        [objectToModify setValue:[NSNumber numberWithInteger:guia.tipoGuia] forKey:@"tipoGuia"];
        if(guia.descripcion){
            [objectToModify setValue:guia.descripcion forKey:@"descripcion"];
        }

        
    }
}
+ (Guia *) getGuiaById:(NSInteger)idGuia{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Guia" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuia == %d", idGuia];
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

@end
