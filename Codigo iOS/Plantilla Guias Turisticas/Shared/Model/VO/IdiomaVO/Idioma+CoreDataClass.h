//
//  Idioma+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Idioma : NSManagedObject
-(id)initIdiomaWithJson:(id)json;

@end

NS_ASSUME_NONNULL_END

#import "Idioma+CoreDataProperties.h"
