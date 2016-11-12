//
//  PoiDAO.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poi+CoreDataClass.h"
@interface PoiDAO : NSObject
+(Poi *)getPoi:(NSInteger *)idPoi;
+(NSArray *)getPoiByCategory:(NSInteger )category;
+(void)insertarPoi:(NSArray *)items;
@end
