//
//  Poi+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Poi+CoreDataClass.h"
#import "CoreDataUtil.h"
#import "PoiImagen+CoreDataProperties.h"
#import "PoiImagenDAO.h"

@implementation Poi
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Poi" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *poi = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (Poi *)poi;
}

-(id)initPoiWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        if([json objectForKey:@"descripcion"] != [NSNull null]){
            self.descripcion = [json objectForKey:@"descripcion"];
        }
        if([json objectForKey:@"email"] != [NSNull null]){
            self.email = [json objectForKey:@"email"] ;
        }
        if([json objectForKey:@"idPoi"] != [NSNull null]){
            self.idPoi = [[json objectForKey:@"idPoi"] integerValue];
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
        if([json objectForKey:@"telefono"] != [NSNull null]){
            self.telefono = [json objectForKey:@"telefono"] ;
        }
        if([json objectForKey:@"tipoPoi"] != [NSNull null]){
            self.tipoPoi = [[json objectForKey:@"tipoPoi"] integerValue];
        }
        if([json objectForKey:@"titulo"] != [NSNull null]){
            self.titulo = [json objectForKey:@"titulo"] ;
        }
        if([json objectForKey:@"urlCompartir"] != [NSNull null]){
            self.urlCompartir = [json objectForKey:@"urlCompartir"] ;
        }
        if([json objectForKey:@"urlImagen"] != [NSNull null]){
            self.urlImagen = [json objectForKey:@"urlImagen"] ;
        }
        if([json objectForKey:@"urlWeb"] != [NSNull null]){
            self.urlWeb = [json objectForKey:@"urlWeb"] ;
        }
        if([json objectForKey:@"listPoiImagen"] != [NSNull null]){
           // [[NSOperationQueue new] addOperationWithBlock:^{
                NSMutableArray * listImage  = [NSMutableArray new];
                for (id jsonImage in [json objectForKey:@"listPoiImagen"]) {
                    PoiImagen * poiImagen = [[PoiImagen alloc] initPoiImagenWithJson:jsonImage];
                    if(poiImagen){
                        [listImage addObject:poiImagen];
                    }
                    
                }
                [PoiImagenDAO insertarPoiImagen:listImage];
           // }];
            
            
        }

        
    }
    return self;
}


@end
