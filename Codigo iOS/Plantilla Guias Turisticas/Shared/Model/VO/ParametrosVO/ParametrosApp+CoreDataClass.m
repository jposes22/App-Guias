//
//  ParametrosApp+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ParametrosApp+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation ParametrosApp
// Insert code here to add functionality to your managed object subclass
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"ParametrosApp" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *parameter = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (ParametrosApp *)parameter;
}
-(id)initParametros{
    self = [self init:nil];
    if(self){
    }
    return self;
}
-(id)initTOParametrosWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        if([json objectForKey:@"clave"] != [NSNull null]){
            self.clave = [json objectForKey:@"clave"];
        }
        if([json objectForKey:@"valor"] != [NSNull null]){
            self.valor = [json objectForKey:@"valor"];
        }
    }
    return self;
}

-(id)initWithKey:(NSString *)key value:(NSString*)value activo:(BOOL)activo{
    self = [self init:self.managedObjectContext];
    if (self) {
        self.clave = key;
        self.valor = value;
        self.isActivo = activo;
    }
    return self;
}

@end
