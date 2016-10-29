//
//  ParametrosRepositorio.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParametrosRepositorio : NSObject

+(BOOL) saveParametersInBD;
+(NSString*) getParameterString:(NSString*) key;
+(NSInteger) getParameterInteger: (NSString*) key;
+(NSNumber *) getParameterNumber: (NSString*) key;

@end
