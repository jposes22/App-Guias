//
//  RemotePoi.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemotePoi.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"
#import "RemotePoiVO.h"
#import "PoiDAO.h"
@implementation RemotePoi
-(void)getPoi{
    
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_POIS, [[Settings sharedInstance] lastUpdatePoi], [[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
            RemotePoiVO * poiRemote = [[RemotePoiVO alloc] initPoi:responseObject];
            [PoiDAO insertarPoi:poiRemote.answere];
            if(_delegatePoi && [_delegatePoi respondsToSelector:@selector(communicationUpdatePoi:)]){
                [[Settings sharedInstance] setLastUpdatePoi:poiRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[poiRemote answere] count] >0 ){
                    [_delegatePoi communicationUpdatePoi:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                     [_delegatePoi communicationUpdatePoi:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
            
        }
        @catch (NSException *exception) {
            if(_delegatePoi && [_delegatePoi respondsToSelector:@selector(communicationUpdatePoi:)]){
                 [_delegatePoi communicationUpdatePoi:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegatePoi && [_delegatePoi respondsToSelector:@selector(communicationUpdatePoi:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegatePoi communicationUpdatePoi:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegatePoi communicationUpdatePoi:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];
    
}

@end
