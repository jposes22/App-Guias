//
//  PoiImagenDAO.h
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 12/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PoiImagen+CoreDataProperties.h"

@interface PoiImagenDAO : NSObject
+(PoiImagen *)getPoiImagen:(NSInteger *)idPoiImagen;
+(void)insertarPoiImagen:(NSArray *)items;
@end
