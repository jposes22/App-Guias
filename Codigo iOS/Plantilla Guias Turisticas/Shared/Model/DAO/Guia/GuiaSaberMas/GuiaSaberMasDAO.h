//
//  GuiaSaberMasDAO.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuiaSaberMas+CoreDataProperties.h"
@interface GuiaSaberMasDAO : NSObject
+(NSArray *)getGuiasSaberMas:(NSInteger)idGuiaDetalle;
+(void)insertarGuiasSaberMas:(NSArray *)items;
+(GuiaSaberMas *) getGuiaSaberMasById:(NSInteger)idGuiaSaberMas;
@end
