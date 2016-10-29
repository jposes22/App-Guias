//
//  Guia+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GuiaDetalle;

NS_ASSUME_NONNULL_BEGIN

@interface Guia : NSManagedObject
-(id)initGuiaWithJson:(id)json;

@end

NS_ASSUME_NONNULL_END

#import "Guia+CoreDataProperties.h"
