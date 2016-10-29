//
//  Menu+CoreDataClass.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Menu+CoreDataClass.h"
#import "CoreDataUtil.h"

@implementation Menu

-(id)init:(NSManagedObjectContext *)context{
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Menu" inManagedObjectContext:[[CoreDataUtil instancia] managedObjectContext]];
    NSManagedObject *menu = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    return (Menu *)menu;
}

-(id)initToMenuWithJson:(id)json{
    self = [self init:self.managedObjectContext];
    if(self){
        if([json objectForKey:@"codeMenu"] != [NSNull null]){
            self.codeMenu = [[json objectForKey:@"codeMenu"] integerValue];
        }
        if([json objectForKey:@"idMenu"] != [NSNull null]){
            self.idMenu = [[json objectForKey:@"idMenu"] longValue];
        }
        if([json objectForKey:@"orden"] != [NSNull null]){
            self.orden = [[json objectForKey:@"orden"] integerValue];
        }
        if([json objectForKey:@"isActivo"] != [NSNull null]){
            self.isActivo = [[json objectForKey:@"isActivo"] boolValue];
        }
    }
    return self;
}
@end
