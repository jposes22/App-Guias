//
//  MenuDAO.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "MenuDAO.h"
#import "CoreDataUtil.h"
#import "Menu+CoreDataClass.h"

@implementation MenuDAO
+(NSArray *)getMenuItems{
    //Obtenemos la entidad correspondiente al modelo
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Menu" inManagedObjectContext:context];
    //Creamos la consulta y le asociamos la entidad que acabamos de crear
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"isActivo == YES"];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"orden" ascending:YES];
    
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
+(void)insertarMenuItems:(NSArray *)items{
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    __block NSError *error;
    for(Menu *item in items){
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Menu"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"idMenu == %d", item.idMenu]];
        [request setFetchLimit:1];
        NSUInteger count = [context countForFetchRequest:request error:&error];
        if (count == NSNotFound){
            //Ocurrio algun error
        } else if (count == 0){ //No existe entonces creamos un objecto
            [context insertObject:item];
        }else{
            [self updateItemMenu:item];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[CoreDataUtil instancia] saveContext:&error];
    });
}

+(void)updateItemMenu:(Menu *)item{
    NSError *error;
    NSManagedObjectContext *context = [[CoreDataUtil instancia] managedObjectContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"Menu"];
    [req setPredicate:[NSPredicate predicateWithFormat:@"idMenu == %d", item.idMenu]];
    NSArray *array = [context executeFetchRequest:req error:&error];
    if(array != nil && array.count == 1){
        Menu * objectToModify = [array objectAtIndex:0];
        [objectToModify setValue:[NSNumber numberWithInt:item.codeMenu] forKey:@"codeMenu"];
        [objectToModify setValue:[NSNumber numberWithBool:item.isActivo] forKey:@"isActivo"];
    }
}

@end
