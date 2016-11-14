//
//  GuiaSaberMasDetalleDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleDAO.h"
#import "CoreDataUtil.h"
#import "GuiaSaberMasDAO.h"

@implementation GuiaSaberMasDetalleDAO
+(NSArray *)getPGuiaSaberMAsDetalle:(NSInteger)idGuiaSaberMas{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaSaberMasDetalle" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuiaSaberMas == %d", idGuiaSaberMas];
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
+(void)insertarGuiaSaberMasDetalle:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(GuiaSaberMasDetalle *guiaSaberMasDetalle in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"GuiaSaberMasDetalle"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuiaSaberMasDetalle == %d", guiaSaberMasDetalle.idGuiaSaberMasDetalle]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            //Obtenemos la guia asociada
           // GuiaSaberMas * guiaSaberMas = [GuiaSaberMasDAO getGuiaSaberMasById:guiaSaberMasDetalle.idGuiaSaberMas];
            [context insertObject:guiaSaberMasDetalle];
            
           /* if(guiaSaberMas){
                [guiaSaberMasDetalle setGuiaSaberMas:guiaSaberMas];
                [guiaSaberMas addListGuiaSaberMasDetalleObject:guiaSaberMasDetalle];
            }*/
            
        }else{
            [self updateGuiaSaberMasDetalle:guiaSaberMasDetalle];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
    
    
}
+(void)updateGuiaSaberMasDetalle:(GuiaSaberMasDetalle *)guiaDetalle{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMasDetalle"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idGuiaSaberMasDetalle == %d", guiaDetalle.idGuiaSaberMasDetalle]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        GuiaSaberMasDetalle * objectToModify = [array objectAtIndex:0];
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
        
    }
}
+ (GuiaSaberMasDetalle *)getGuiaSaberMasDetalleById:(NSInteger) idGuiaSaberMasDetalle{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaSaberMasDetalle" inManagedObjectContext:context];
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
        if(array.count > 0){
            return [array objectAtIndex:0];
        }
        
    }
    return nil;

}

@end
