//
//  GuiaSaberMas+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GuiaDetalle, GuiaSaberMasDetalle;

NS_ASSUME_NONNULL_BEGIN

@interface GuiaSaberMas : NSManagedObject
-(id)initGuiaSaberMasWithJson:(id)json;
@end

NS_ASSUME_NONNULL_END

#import "GuiaSaberMas+CoreDataProperties.h"
