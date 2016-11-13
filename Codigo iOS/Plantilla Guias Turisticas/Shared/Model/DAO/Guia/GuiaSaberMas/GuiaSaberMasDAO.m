//
//  GuiaSaberMasDAO.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDAO.h"
#import "CoreDataUtil.h"
#import "GuiaSaberMasList.h"

@implementation GuiaSaberMasDAO
+(NSArray *)getGuiasSaberMas:(NSInteger)idGuiaDetalle{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaSaberMas" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"isActivo == YES && idGuiaDetalle == %d", idGuiaDetalle];
    NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"SELF.titulo" ascending:YES];
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
        for (GuiaSaberMas * guia  in array) {
            [listado addObject: [GuiaSaberMasList getGuiaListObject:guia]];
        }
        return listado;
    }
    return nil;

}
+(void)insertarGuiasSaberMas:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(GuiaSaberMas *guiaSaberMas in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"GuiaSaberMas"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idGuiaSaberMas == %d", guiaSaberMas.idGuiaSaberMas]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:guiaSaberMas];
        }else{
            [self updatePoi:guiaSaberMas];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
   
}
+(void)updatePoi:(GuiaSaberMas *)guiaSaberMas{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"GuiaSaberMas"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"guiaSaberMas == %d", guiaSaberMas.idGuiaSaberMas]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        GuiaSaberMas * objectToModify = [array objectAtIndex:0];
        if(guiaSaberMas.titulo){
            [objectToModify setValue:guiaSaberMas.titulo forKey:@"titulo"];
        }
        if(guiaSaberMas.urlAudioGuia){
            [objectToModify setValue:guiaSaberMas.urlAudioGuia forKey:@"urlAudioGuia"];
        }
        [objectToModify setValue:[NSNumber numberWithBool:guiaSaberMas.isActivo] forKey:@"isActivo"];
        [objectToModify setValue:[NSNumber numberWithDouble:guiaSaberMas.latitud] forKey:@"latitud"];
        [objectToModify setValue:[NSNumber numberWithDouble:guiaSaberMas.longitud] forKey:@"longitud"];
        
    }
}

+(GuiaSaberMas *) getGuiaSaberMasById:(NSInteger)idGuiaSaberMas{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"GuiaSaberMas" inManagedObjectContext:context];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"idGuiaSaberMas == %d", idGuiaSaberMas];
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
