//
//  RemoteGuiaSaberMasDetalle.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaSaberMasDetalle.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"

#import "GuiaSaberMasDetalleDAO.h"
#import "RemoteGuiaSaberMasDetalleVO.h"
@implementation RemoteGuiaSaberMasDetalle
-(void)getGuiaSaberMasDetalle{
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_GUIA_SABER_MAS_DETALLE, [[Settings sharedInstance] lastUpdateGuiaSaberMasDetalle], [[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
            
            RemoteGuiaSaberMasDetalleVO * guiaDetalleRemote = [[RemoteGuiaSaberMasDetalleVO alloc] initGuiaSaberMasDetalle:responseObject];
            [GuiaSaberMasDetalleDAO insertarGuiaSaberMasDetalle:guiaDetalleRemote.answere];
            if(_delegateGuiaSaberMasDetalle && [_delegateGuiaSaberMasDetalle respondsToSelector:@selector(communicationUpdateGuiaSaberMasDetalle:)]){
                [[Settings sharedInstance] setLastUpdateGuiaSaberMasDetalle:guiaDetalleRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[guiaDetalleRemote answere] count] >0 ){
                    [_delegateGuiaSaberMasDetalle communicationUpdateGuiaSaberMasDetalle:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateGuiaSaberMasDetalle communicationUpdateGuiaSaberMasDetalle:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
            
        }
        @catch (NSException *exception) {
            if(_delegateGuiaSaberMasDetalle && [_delegateGuiaSaberMasDetalle respondsToSelector:@selector(communicationUpdateGuiaSaberMasDetalle:)]){
                [_delegateGuiaSaberMasDetalle communicationUpdateGuiaSaberMasDetalle:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateGuiaSaberMasDetalle && [_delegateGuiaSaberMasDetalle respondsToSelector:@selector(communicationUpdateGuiaSaberMasDetalle:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateGuiaSaberMasDetalle communicationUpdateGuiaSaberMasDetalle:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateGuiaSaberMasDetalle communicationUpdateGuiaSaberMasDetalle:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];

}
@end
