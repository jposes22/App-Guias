//
//  GuiaDetalleImagen+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleImagen+CoreDataClass.h"
#import "CoreDataUtil.h"
@implementation GuiaDetalleImagen
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"GuiaDetalleImagen" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guiaDetalleImagen = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (GuiaDetalleImagen *)guiaDetalleImagen;
}

-(id)initGuiaDetalleImagenWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuiaDetalle"] != [NSNull null]){
            self.idGuiaDetalle = [[json objectForKey:@"idGuiaDetalle"] integerValue];
        }
        if([json objectForKey:@"idGuiaDetalleImagen"] != [NSNull null]){
            self.idGuiaDetalleImagen = [[json objectForKey:@"idGuiaDetalleImagen"] integerValue];
        }
        
        if([json objectForKey:@"urlImagen"] != [NSNull null]){
                
            self.urlImagen = [json objectForKey:@"urlImagen"] ;
            
            NSURL *url = [NSURL URLWithString:self.urlImagen];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if(data){
                NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                path = [path stringByAppendingString:[NSString stringWithFormat:@"/%lld_%lld_Image.png",self.idGuiaDetalle,self.idGuiaDetalleImagen]];
                [data writeToFile:path atomically:YES];
                self.urlImagen = [NSString stringWithFormat:@"/%lld_%lld_Image.png",self.idGuiaDetalle,self.idGuiaDetalleImagen];
            }else{
                return nil;
            }
        }
        
    }
    return self;
}

@end
