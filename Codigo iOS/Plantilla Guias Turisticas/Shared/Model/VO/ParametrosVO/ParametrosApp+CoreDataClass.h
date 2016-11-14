//
//  ParametrosApp+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParametrosApp : NSManagedObject
-(id)initTOParametrosWithJson:(id)json;
-(id)initParametros;
-(id)initWithKey:(NSString *)key value:(NSString*)value activo:(BOOL)activo;
@end

NS_ASSUME_NONNULL_END

#import "ParametrosApp+CoreDataProperties.h"
