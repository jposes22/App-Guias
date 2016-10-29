//
//  ParametrosDAO.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParametrosApp+CoreDataClass.h"


@interface ParametrosDAO : NSObject
+(NSDictionary *)getParametros;
+(void)insertarParametros:(NSArray *)parametros;
+(NSString *)getValueForKey:(NSString *)key;
@end
