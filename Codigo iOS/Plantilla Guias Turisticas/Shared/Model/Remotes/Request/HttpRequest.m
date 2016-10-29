//
//  HttpRequest.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HttpRequest.h"
#import "ParametrosRepositorio.h"
#import "Constants.h"

@implementation HttpRequest
-(id) initWithUrl:(NSString*) urlString httpMethod:(NSString*) httpMethod objectToSend:(id)object {
    if(self = [super init]){
        
        [self setURL:[NSURL URLWithString:[HttpRequest createUrlWithProtocol:urlString]]];
        [self setCachePolicy:NSURLRequestReloadIgnoringCacheData];
        [self setTimeoutInterval:30/1000];
        [self setHTTPMethod:httpMethod];
        [self setValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        if(object){
            [self setHTTPBody:object];
        }
        
    }
    
    return self;
    
}
+(NSString *) createUrlWithProtocol:(NSString*) method{
    NSString *url = [NSString stringWithFormat:@"%@/%@",[ParametrosRepositorio getParameterString:k_URL_UPDATE_SERVICE] ,method];
    NSLog(@"REQUEST URL %@" , url);
    return url;
}

@end
