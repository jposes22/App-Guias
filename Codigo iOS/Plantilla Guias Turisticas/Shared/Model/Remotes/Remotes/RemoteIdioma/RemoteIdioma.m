//
//  RemoteIdioma.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteIdioma.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"
#import "RemoteIdiomaVO.h"
#import "IdiomaDAO.h"

@implementation RemoteIdioma
-(void)getIdiomas{
    
    NSString * url = [NSString stringWithFormat:@"%@/%@", kURL_GET_IDIOMA, [[Settings sharedInstance] lastUpdateIdioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
            RemoteIdiomaVO * idiomaRemote = [[RemoteIdiomaVO alloc] initRemoteIdioma:responseObject];
            [IdiomaDAO insertarIdiomas:idiomaRemote.answere];
            if(_delegateIdioma && [_delegateIdioma respondsToSelector:@selector(communicationUpdateIdiomas:)]){
                [[Settings sharedInstance] setLastUpdateIdioma:idiomaRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[idiomaRemote answere] count] >0 ){
                    [_delegateIdioma communicationUpdateIdiomas:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateIdioma communicationUpdateIdiomas:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
        }
        @catch (NSException *exception) {
            if(_delegateIdioma && [_delegateIdioma respondsToSelector:@selector(communicationUpdateIdiomas:)]){
                [_delegateIdioma communicationUpdateIdiomas:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateIdioma && [_delegateIdioma respondsToSelector:@selector(communicationUpdateIdiomas:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateIdioma communicationUpdateIdiomas:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateIdioma communicationUpdateIdiomas:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];
    
}

@end
