//
//  Validator.h
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject


+(BOOL) validateEmail:(NSString*) email;
+(BOOL) validatePhone:(NSString*) phone;
+(BOOL) validateWeb:(NSString*) urlWeb;
+(BOOL) validatePositionGPS:(double) latitud andLongitud:(double)longitud;
@end
