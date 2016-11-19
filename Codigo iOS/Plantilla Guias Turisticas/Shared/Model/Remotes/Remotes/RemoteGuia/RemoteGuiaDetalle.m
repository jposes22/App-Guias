 //
//  RemoteGuiaDetalle.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaDetalle.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"

#import "RemoteDetalleGuiaVO.h"
#import "GuiaDetalleDAO.h"

@implementation RemoteGuiaDetalle
-(void)getGuiasDetalle{
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_GUIA_DETALLE, [[Settings sharedInstance] lastUpdateGuiaDetalle], [[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
                 RemoteDetalleGuiaVO * guiaDetalleRemote = [[RemoteDetalleGuiaVO alloc] initGuiaDetalle:responseObject];
                 [GuiaDetalleDAO insertarGuiaDetalle:guiaDetalleRemote.answere];
            if(_delegateGuiaDetalle && [_delegateGuiaDetalle respondsToSelector:@selector(communicationUpdateGuiaDetalle:)]){
                [[Settings sharedInstance] setLastUpdateGuiaDetalle:guiaDetalleRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[guiaDetalleRemote answere] count] >0 ){
                    [_delegateGuiaDetalle communicationUpdateGuiaDetalle:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateGuiaDetalle communicationUpdateGuiaDetalle:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
            
        }
        @catch (NSException *exception) {
            if(_delegateGuiaDetalle && [_delegateGuiaDetalle respondsToSelector:@selector(communicationUpdateGuiaDetalle:)]){
                [_delegateGuiaDetalle communicationUpdateGuiaDetalle:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateGuiaDetalle && [_delegateGuiaDetalle respondsToSelector:@selector(communicationUpdateGuiaDetalle:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateGuiaDetalle communicationUpdateGuiaDetalle:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateGuiaDetalle communicationUpdateGuiaDetalle:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];

}
@end
