//
//  Idioma+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Idioma+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation Idioma
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Idioma" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *idioma = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (Idioma *)idioma;
}

-(id)initIdiomaWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        if([json objectForKey:@"codigoIdioma"] != [NSNull null]){
            self.codigoIdioma = [json objectForKey:@"codigoIdioma"];
        }
        if([json objectForKey:@"idIdioma"] != [NSNull null]){
            self.idIdioma = [[json objectForKey:@"idIdioma"] intValue];
        }
        if([json objectForKey:@"nombreIdioma"] != [NSNull null]){
            self.nombreIdioma = [json objectForKey:@"nombreIdioma"];
        }
        if([json objectForKey:@"isActivo"] != [NSNull null]){
            self.isActivo = [[json objectForKey:@"isActivo"] boolValue];
        }
    }
    return self;
}

@end
