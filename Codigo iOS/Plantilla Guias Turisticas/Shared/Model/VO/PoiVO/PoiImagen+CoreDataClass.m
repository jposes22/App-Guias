//
//  PoiImagen+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiImagen+CoreDataClass.h"
#import "CoreDataUtil.h"
@implementation PoiImagen
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"PoiImagen" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *poiImagen = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (PoiImagen *)poiImagen;
}

-(id)initPoiImagenWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){

        if([json objectForKey:@"idPoiImagen"] != [NSNull null]){
            self.idPoiImagen = [[json objectForKey:@"idPoiImagen"] integerValue];
        }
        if([json objectForKey:@"idPoi"] != [NSNull null]){
            self.idPoi = [[json objectForKey:@"idPoi"] integerValue];
        }

        if([json objectForKey:@"urlImagen"] != [NSNull null]){
            self.urlImagen = [json objectForKey:@"urlImagen"] ;
        }
    }
    return self;
}

@end
