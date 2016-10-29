//
//  Poi+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Poi : NSManagedObject
-(id)initPoiWithJson:(id)json;

@end

NS_ASSUME_NONNULL_END

#import "Poi+CoreDataProperties.h"
