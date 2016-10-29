//
//  GuiaSaberMasDetalle+CoreDataClass.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GuiaSaberMas, GuiaSaberMasDetalleImagen;

NS_ASSUME_NONNULL_BEGIN

@interface GuiaSaberMasDetalle : NSManagedObject
-(id)initGuiaSaberMasDetaleWithJson:(id)json;
@end

NS_ASSUME_NONNULL_END

#import "GuiaSaberMasDetalle+CoreDataProperties.h"
