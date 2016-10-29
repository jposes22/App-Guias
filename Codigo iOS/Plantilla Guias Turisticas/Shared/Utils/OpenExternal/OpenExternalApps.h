//
//  OpenExternalApps.h
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenExternalApps : NSObject
+(void) openPhoneCall:(NSString*) numberPhone;
+(void) openSendEmail:(NSString *)emailTo;
+(void) openUrlWeb:(NSString*) urlWeb;
+(void) openGPSWithLatitud:(double) latitud andLongitud:(double) longitud;
@end
