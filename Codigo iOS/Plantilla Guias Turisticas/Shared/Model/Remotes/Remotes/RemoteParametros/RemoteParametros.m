//
//  RemoteParametros.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteParametros.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"
#import "ParametrosDAO.h"

#import "RemoteParametrosVO.h"

@implementation RemoteParametros
-(void)getParametros{
    
    NSString * url = [NSString stringWithFormat:@"%@/%@", kURL_GET_PARAMETROS, [[Settings sharedInstance] lastUpdateParametros]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
            RemoteParametrosVO * parametrosRemote = [[RemoteParametrosVO alloc] initParametros:responseObject];
            [ParametrosDAO insertarParametros:parametrosRemote.answere];
            if(_delegateParametros && [_delegateParametros respondsToSelector:@selector(communicationUpdateParametros:)]){
                [[Settings sharedInstance] setLastUpdateParametros:parametrosRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[parametrosRemote answere] count] >0 ){
                    [_delegateParametros communicationUpdateParametros:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateParametros communicationUpdateParametros:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
        }
        @catch (NSException *exception) {
            if(_delegateParametros && [_delegateParametros respondsToSelector:@selector(communicationUpdateParametros:)]){
                [_delegateParametros communicationUpdateParametros:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateParametros && [_delegateParametros respondsToSelector:@selector(communicationUpdateParametros:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                 [_delegateParametros communicationUpdateParametros:kDAO_RESPONSE_TIMEOUT];
            }else{
                 [_delegateParametros communicationUpdateParametros:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];
    
}

@end
