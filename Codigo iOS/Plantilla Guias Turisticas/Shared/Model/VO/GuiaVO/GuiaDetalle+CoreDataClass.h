//
//  GuiaDetalle+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GuiaDetalleImagen, TO_Guia;

NS_ASSUME_NONNULL_BEGIN

@interface GuiaDetalle : NSManagedObject
-(id)initGuiaDetaleWithJson:(id)json;

@end

NS_ASSUME_NONNULL_END

#import "GuiaDetalle+CoreDataProperties.h"
