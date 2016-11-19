//
//  GuiaDetalle+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalle+CoreDataClass.h"
#import "CoreDataUtil.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
@implementation GuiaDetalle
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"GuiaDetalle" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guiadetalle = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (GuiaDetalle *)guiadetalle;
}

-(id)initGuiaDetaleWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuia"] != [NSNull null]){
            self.idGuia = [[json objectForKey:@"idGuia"] integerValue];
        }
        if([json objectForKey:@"idGuiaDetalle"] != [NSNull null]){
            self.idGuiaDetalle = [[json objectForKey:@"idGuiaDetalle"] integerValue];
        }
        if([json objectForKey:@"orden"] != [NSNull null]){
            self.orden = [[json objectForKey:@"orden"] integerValue];
        }
        if([json objectForKey:@"isActivo"] != [NSNull null]){
            self.isActivo = [[json objectForKey:@"isActivo"] boolValue];
        }
        if([json objectForKey:@"latitud"] != [NSNull null]){
            self.latitud = [[json objectForKey:@"latitud"] doubleValue];
        }
        if([json objectForKey:@"longitud"] != [NSNull null]){
            self.longitud = [[json objectForKey:@"longitud"] doubleValue];
        }
        if([json objectForKey:@"titulo"] != [NSNull null]){
            //if(((NSString*) [json objectForKey:@"titulo"]).length >1 ){
                self.titulo = [json objectForKey:@"titulo"] ;
           // }
        }
        if([json objectForKey:@"descripcion"] != [NSNull null]){
            self.descripcion = [json objectForKey:@"descripcion"] ;
        }
        if([json objectForKey:@"listGuiaDetalleImagen"] != [NSNull null]){
                NSMutableArray * listImage  = [NSMutableArray new];
                 for (id jsonImage in [json objectForKey:@"listGuiaDetalleImagen"]) {
                     GuiaDetalleImagen * guiaImagenDetalle = [[GuiaDetalleImagen alloc] initGuiaDetalleImagenWithJson:jsonImage];
                     if(guiaImagenDetalle){
                         [listImage addObject:guiaImagenDetalle];
                     }
                 }
                 [GuiaDetalleImagenDAO insertarGuiaDetalleImagen:listImage];
        }
    }
    return self;
    
    

}

@end
