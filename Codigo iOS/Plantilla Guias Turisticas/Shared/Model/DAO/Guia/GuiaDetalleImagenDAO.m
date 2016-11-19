//
//  GuiaDetalleImagenDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleImagenDAO.h"
#import "CoreDataUtil.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleDAO.h"
@implementation GuiaDetalleImagenDAO
+(NSArray *)getGuiaDetalleImagen:(NSInteger)idGuiaDetalleImagen{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaDetalleImagen" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuiaDetalle == %d", idGuiaDetalleImagen];
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
+(void)insertarGuiaDetalleImagen:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(GuiaDetalleImagen *guiaDetalleImagen in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"GuiaDetalleImagen"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuiaDetalleImagen == %d", guiaDetalleImagen.idGuiaDetalleImagen ]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            //Obtenemos la guia asociada
            //GuiaDetalle * guiaDetalle = [GuiaDetalleDAO getGuiaDetalleById:guiaDetalleImagen.idGuiaDetalle];
            [context insertObject:guiaDetalleImagen];
            
            /*if(guiaDetalle){
                [guiaDetalleImagen setDetalleGuia:guiaDetalle];
                [guiaDetalle addImagenesDetalleObject:guiaDetalleImagen];
            }*/
            
        }else{
            [self updateGuiaDetalleImagen:guiaDetalleImagen];
        }
    }
  //  dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    //});

}
+(void)updateGuiaDetalleImagen:(GuiaDetalleImagen *)guiaDetalleImagen{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"GuiaDetalleImagen"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idGuiaDetalleImagen == %d", guiaDetalleImagen.idGuiaDetalleImagen]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        GuiaDetalleImagen * objectToModify = [array objectAtIndex:0];
        if(guiaDetalleImagen.urlImagen){
            [objectToModify setValue:guiaDetalleImagen.urlImagen forKey:@"urlImagen"];
        }
        [objectToModify setValue:[NSNumber numberWithInteger:guiaDetalleImagen.idGuiaDetalle] forKey:@"idGuiaDetalle"];
        [objectToModify setValue:[NSNumber numberWithInteger:guiaDetalleImagen.idGuiaDetalleImagen] forKey:@"idGuiaDetalleImagen"];

    }
}

@end
