//
//  GuiaSaberMasDetalleImagen+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMasDetalleImagen+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation GuiaSaberMasDetalleImagen
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"GuiaSaberMasDetalleImagen" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guiaSaberMasDetalleImagen = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (GuiaSaberMasDetalleImagen *)guiaSaberMasDetalleImagen;
}

-(id)initGuiaDetalleImagenWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuiaSaberMAsDetalleImagen"] != [NSNull null]){
            self.idGuiaSaberMAsDetalleImagen = [[json objectForKey:@"idGuiaSaberMAsDetalleImagen"] integerValue];
        }
        if([json objectForKey:@"idGuiaSaberMasDetalle"] != [NSNull null]){
            self.idGuiaSaberMasDetalle = [[json objectForKey:@"idGuiaSaberMasDetalle"] integerValue];
        }
        
        if([json objectForKey:@"urlImagen"] != [NSNull null]){
            //
            
            self.urlImagen = [json objectForKey:@"urlImagen"] ;
            
            NSURL *url = [NSURL URLWithString:self.urlImagen];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if(data){
                NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                path = [path stringByAppendingString:[NSString stringWithFormat:@"/%lld_%lld_SaberMas_Image.png",self.idGuiaSaberMasDetalle,self.idGuiaSaberMAsDetalleImagen]];
                [data writeToFile:path atomically:YES];
                self.urlImagen = [NSString stringWithFormat:@"/%lld_%lld_SaberMas_Image.png",self.idGuiaSaberMasDetalle,self.idGuiaSaberMAsDetalleImagen];
            }else{
                return nil;
            }
        }

    }
    return self;
}
@end
