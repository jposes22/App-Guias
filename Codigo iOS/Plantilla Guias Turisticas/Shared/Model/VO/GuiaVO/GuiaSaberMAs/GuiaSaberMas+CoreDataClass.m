//
//  GuiaSaberMas+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaSaberMas+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation GuiaSaberMas
-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"GuiaSaberMas" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *guiaSaberMas = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (GuiaSaberMas *)guiaSaberMas;
}

-(id)initGuiaSaberMasWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        
        if([json objectForKey:@"idGuiaSaberMas"] != [NSNull null]){
            self.idGuiaSaberMas = [[json objectForKey:@"idGuiaSaberMas"] integerValue];
        }
        if([json objectForKey:@"idGuiaDetalle"] != [NSNull null]){
            self.idGuiaDetalle = [[json objectForKey:@"idGuiaDetalle"] integerValue];
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
        if([json objectForKey:@"urlAudioGuia"] != [NSNull null]){
            [[NSOperationQueue new] addOperationWithBlock:^{

            self.urlAudioGuia = [json objectForKey:@"urlAudioGuia"] ;
            NSURL *url = [NSURL URLWithString:self.urlAudioGuia];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if(data){
                NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                path = [path stringByAppendingString:[NSString stringWithFormat:@"/%lld_audioguia_saber_mas.mp3",self.idGuiaSaberMas]];
                [data writeToFile:path atomically:YES];
                self.urlAudioGuia = [NSString stringWithFormat:@"/%lld_audioguia_saber_mas.mp3",self.idGuiaSaberMas];
            }else{
                self.urlAudioGuia = nil;
            }
            }];
        }

    }
    return self;
}

@end
