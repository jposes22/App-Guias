//
//  GuiaDetalleDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleDAO.h"
#import "CoreDataUtil.h"
#import "GuiaDAO.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
@implementation GuiaDetalleDAO
+(NSArray *)getGuiaDetalleByIdGuia:(NSInteger)idGuia{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaDetalle" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"isActivo == YES AND idGuia == %d", idGuia];
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
        return array;
        
    }
    return nil;

    
}
+(void)insertarGuiaDetalle:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(GuiaDetalle *guiaDetalle in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"GuiaDetalle"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuiaDetalle == %d", guiaDetalle.idGuiaDetalle]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
            NSLog(@"error al insertar el detalle de la guia %@", error);
        } else if (count == 0){ //No existe entonces creamos un objecto
            //Obtenemos la guia asociada
            Guia * guia = [GuiaDAO getGuiaById:guiaDetalle.idGuia];
            [context insertObject:guiaDetalle];
           
            if(guia){
                [guiaDetalle setGuia:guia];
                [guia addDetalleGuiaObject:guiaDetalle];
            }
        }else{
            [self updateGuiaDetalle:guiaDetalle];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });

    
}
+(void)updateGuiaDetalle:(GuiaDetalle *)guiaDetalle{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"GuiaDetalle"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idGuiaDetalle == %d", guiaDetalle.idGuiaDetalle]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        GuiaDetalle * objectToModify = [array objectAtIndex:0];
        if(guiaDetalle.titulo){
            [objectToModify setValue:guiaDetalle.titulo forKey:@"titulo"];
        }
        if(guiaDetalle.descripcion){
            [objectToModify setValue:guiaDetalle.descripcion forKey:@"descripcion"];
        }

        [objectToModify setValue:[NSNumber numberWithInteger:guiaDetalle.orden] forKey:@"orden"];
        [objectToModify setValue:[NSNumber numberWithBool:guiaDetalle.isActivo] forKey:@"isActivo"];
        [objectToModify setValue:[NSNumber numberWithDouble:guiaDetalle.latitud] forKey:@"latitud"];
        [objectToModify setValue:[NSNumber numberWithDouble:guiaDetalle.longitud] forKey:@"longitud"];
        //Borramos todas las imagenes
        [objectToModify removeImagenesDetalle:objectToModify.imagenesDetalle];
        //Volvemos a poner las imagenes
        [objectToModify addImagenesDetalle:guiaDetalle.imagenesDetalle];
        
    }
}
+ (GuiaDetalle *)getGuiaDetalleById:(NSInteger) idGuiaDetalle{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaDetalle" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuiaDetalle == %d", idGuiaDetalle];
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

