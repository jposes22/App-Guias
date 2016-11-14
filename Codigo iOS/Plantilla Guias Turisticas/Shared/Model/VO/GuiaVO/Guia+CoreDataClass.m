//
//  Guia+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Guia+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation Guia
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Guia" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guia = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (Guia *)guia;
}

-(id)initGuiaWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuia"] != [NSNull null]){
            self.idGuia = [[json objectForKey:@"idGuia"] integerValue];
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
        if([json objectForKey:@"urlAudioGuia"] != [NSNull null]){

            self.urlAudioGuia = [json objectForKey:@"urlAudioGuia"] ;
            NSURL *url = [NSURL URLWithString:self.urlAudioGuia];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if(data){
                NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                path = [path stringByAppendingString:[NSString stringWithFormat:@"/%lld_audioguia.mp3",self.idGuia]];
                [data writeToFile:path atomically:YES];
                self.urlAudioGuia = [NSString stringWithFormat:@"/%lld_audioguia.mp3",self.idGuia];
            }else{
                self.urlAudioGuia = nil;
            }
        }
        if([json objectForKey:@"orden"] != [NSNull null]){
            self.orden = [[json objectForKey:@"orden"] integerValue];
        }
        if([json objectForKey:@"tipoGuia"] != [NSNull null]){
            self.tipoGuia = [[json objectForKey:@"tipoGuia"] integerValue];
        }
    }
    return self;
}




@end
