//
//  HttpRequest.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest :  NSMutableURLRequest
-(id) initWithUrl:(NSString*) urlString httpMethod:(NSString*) httpMethod objectToSend:(id)object;
+(NSString *) createUrlWithProtocol:(NSString*) method;

@end
