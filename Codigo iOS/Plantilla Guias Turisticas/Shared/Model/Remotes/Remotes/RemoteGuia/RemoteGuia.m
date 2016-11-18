//
//  RemoteGuia.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuia.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"
#import "RemoteGuiaVO.h"
#import "GuiaDAO.h"

@implementation RemoteGuia

-(void)getGuia{
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_GUIA, [[Settings sharedInstance] lastUpdateGuia], [[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
                RemoteGuiaVO * guiaRemote = [[RemoteGuiaVO alloc] initGuia:responseObject];
                [GuiaDAO insertarGuias:guiaRemote.answere];
                 
            if(_delegateGuia && [_delegateGuia respondsToSelector:@selector(communicationUpdateGuia:)]){
                [[Settings sharedInstance] setLastUpdateGuia:guiaRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[guiaRemote answere] count] >0 ){
                    [_delegateGuia communicationUpdateGuia:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateGuia communicationUpdateGuia:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
            
        }
        @catch (NSException *exception) {
            if(_delegateGuia && [_delegateGuia respondsToSelector:@selector(communicationUpdateGuia:)]){
                [_delegateGuia communicationUpdateGuia:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateGuia && [_delegateGuia respondsToSelector:@selector(communicationUpdateGuia:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateGuia communicationUpdateGuia:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateGuia communicationUpdateGuia:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];
    
}

@end
