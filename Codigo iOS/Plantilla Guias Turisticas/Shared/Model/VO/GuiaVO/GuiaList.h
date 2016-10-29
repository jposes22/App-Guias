//
//  GuiaList.h
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guia+CoreDataProperties.h"
@interface GuiaList : NSObject

@property (nonatomic, strong) NSString * titulo;
@property (nonatomic, strong) NSString * descripcion;
@property (nonatomic, strong) NSMutableArray * listOfGuiaDetalle;
@property (nonatomic, strong) NSString * urlAudioGuia;


+(GuiaList *) getGuiaListObject:(Guia *)guia;
@end
