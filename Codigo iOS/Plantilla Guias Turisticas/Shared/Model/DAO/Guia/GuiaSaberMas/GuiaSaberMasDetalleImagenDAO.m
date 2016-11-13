//
//  GuiaSaberMasDetalleImagenDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleImagenDAO.h"
#import "CoreDataUtil.h"
#import "GuiaSaberMasDetalleDAO.h"

@implementation GuiaSaberMasDetalleImagenDAO
+(NSArray *)getGuiaSaberMasDetalleImagen:(NSInteger *)idGuiaSaberMasDetalle{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaSaberMasDetalleImagen" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuiaSaberMasDetalle == %d", idGuiaSaberMasDetalle];
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
+(void)insertarGuiaSaberMasDetalleImagen:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(GuiaSaberMasDetalleImagen *guiaSaberMasDetalleImagen in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"GuiaSaberMasDetalleImagen"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuiaSaberMAsDetalleImagen == %d", guiaSaberMasDetalleImagen.idGuiaSaberMAsDetalleImagen]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            //Obtenemos la guia asociada
            GuiaSaberMasDetalle * guiaSaberMasDetalle = [GuiaSaberMasDetalleDAO getGuiaSaberMasDetalleById:guiaSaberMasDetalleImagen.idGuiaSaberMasDetalle];
            [context insertObject:guiaSaberMasDetalleImagen];
            
            if(guiaSaberMasDetalle){
                [guiaSaberMasDetalleImagen setGuiaSaberMasDetalle:guiaSaberMasDetalle];
                [guiaSaberMasDetalle setGuiaSaberMasDetalleImagen:guiaSaberMasDetalleImagen];
                
            }
            
        }else{
            [self updateGuiaSaberMasDetalleImagen:guiaSaberMasDetalleImagen];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
    
}
+(void)updateGuiaSaberMasDetalleImagen:(GuiaSaberMasDetalleImagen *)guiaSaberMasDetalleImagen{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMasDetalleImagen"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idGuiaSaberMAsDetalleImagen == %d", guiaSaberMasDetalleImagen.idGuiaSaberMAsDetalleImagen]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        GuiaSaberMasDetalleImagen * objectToModify = [array objectAtIndex:0];
        if(guiaSaberMasDetalleImagen.urlImagen){
            [objectToModify setValue:guiaSaberMasDetalleImagen.urlImagen forKey:@"urlImagen"];
        }
    }
}

@end
