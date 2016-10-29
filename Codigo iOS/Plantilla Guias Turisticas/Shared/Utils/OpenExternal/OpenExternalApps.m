//
//  OpenExternalApps.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "OpenExternalApps.h"
#import <UIKit/UIKit.h>

@implementation OpenExternalApps

+(void) openPhoneCall:(NSString*) numberPhone{
    NSString *URLString = [@"telprompt://" stringByAppendingString:numberPhone];
    NSURL *URL = [NSURL URLWithString:URLString];
    [[UIApplication sharedApplication] openURL:URL];
}
+(void) openSendEmail:(NSString *)emailTo{
    NSString *url = [[NSString stringWithFormat:@"mailto:%@" ,emailTo ] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
}
+(void) openUrlWeb:(NSString*) urlWeb{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: urlWeb]];
}
+(void) openGPSWithLatitud:(double) latitud andLongitud:(double) longitud{
    NSString* url = [NSString stringWithFormat:@"http://maps.apple.com/?daddr=%f,%f",latitud, longitud];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
}

@end
