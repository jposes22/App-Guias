//
//  GuiaSaberMasDetalle+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalle+CoreDataClass.h"
#import "CoreDataUtil.h"
#import "GuiaSaberMasDetalleImagen+CoreDataProperties.h"
#import "GuiaSaberMasDetalleImagenDAO.h"

@implementation GuiaSaberMasDetalle
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"GuiaSaberMasDetalle" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guiaSaberMasDetalle = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (GuiaSaberMasDetalle *)guiaSaberMasDetalle;
}

-(id)initGuiaSaberMasDetaleWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuiaSaberMasDetalle"] != [NSNull null]){
            self.idGuiaSaberMasDetalle = [[json objectForKey:@"idGuiaSaberMasDetalle"] integerValue];
        }
        if([json objectForKey:@"idGuiaSaberMas"] != [NSNull null]){
            self.idGuiaSaberMas = [[json objectForKey:@"idGuiaSaberMas"] integerValue];
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
            self.titulo = [json objectForKey:@"titulo"] ;
        }
        if([json objectForKey:@"descripcion"] != [NSNull null]){
            self.descripcion = [json objectForKey:@"descripcion"] ;
        }
        if([json objectForKey:@"listGuiaSaberMasDetalleImagen"] != [NSNull null]){
            [[NSOperationQueue new] addOperationWithBlock:^{
                NSMutableArray * listImage  = [NSMutableArray new];
                for (id jsonImage in [json objectForKey:@"listGuiaSaberMasDetalleImagen"]) {
                    GuiaSaberMasDetalleImagen * guiaImagenDetalle = [[GuiaSaberMasDetalleImagen alloc] initGuiaDetalleImagenWithJson:jsonImage];
                    if(guiaImagenDetalle){
                        [listImage addObject:guiaImagenDetalle];
                    }
                    
                }
                [GuiaSaberMasDetalleImagenDAO insertarGuiaSaberMasDetalleImagen:listImage];
            }];
            
            
        }

    }
    return self;
    
}
@end
