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
            
            NSURL *url = [NSURL URLWithString:self.urlImagen];
            NSData *data = [NSData dataWithContentsOfURL:url];
            if(data){
                NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                path = [path stringByAppendingString:[NSString stringWithFormat:@"/poi_%lld_%lld_Image.png",self.idPoi,self.idPoiImagen]];
                [data writeToFile:path atomically:YES];
                self.urlImagen = [NSString stringWithFormat:@"/poi_%lld_%lld_Image.png",self.idPoi,self.idPoiImagen];
            }else{
                return nil;
            }
        }
    }
    return self;
}

@end
