//
//  RemoteGuiaSaberMas.m
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteGuiaSaberMas.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"

#import "GuiaSaberMasDAO.h"
#import "RemoteGuiaSaberMasVO.h"
@implementation RemoteGuiaSaberMas
-(void)getGuiaSaberMas{
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_GUIA_SABER_MAS, [[Settings sharedInstance] lastUpdateGuiaSaberMas], [[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
            RemoteGuiaSaberMasVO * guiaRemote = [[RemoteGuiaSaberMasVO alloc] initGuiaSaberMas:responseObject];
            [GuiaSaberMasDAO insertarGuiasSaberMas:guiaRemote.answere];
            if(_delegateGuiaSaberMas && [_delegateGuiaSaberMas respondsToSelector:@selector(communicationUpdateGuiaSaberMas:)]){
                [[Settings sharedInstance] setLastUpdateGuiaSaberMas:guiaRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[guiaRemote answere] count] >0 ){
                    [_delegateGuiaSaberMas communicationUpdateGuiaSaberMas:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateGuiaSaberMas communicationUpdateGuiaSaberMas:kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
            
        }
        @catch (NSException *exception) {
            if(_delegateGuiaSaberMas && [_delegateGuiaSaberMas respondsToSelector:@selector(communicationUpdateGuiaSaberMas:)]){
                [_delegateGuiaSaberMas communicationUpdateGuiaSaberMas:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateGuiaSaberMas && [_delegateGuiaSaberMas respondsToSelector:@selector(communicationUpdateGuiaSaberMas:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateGuiaSaberMas communicationUpdateGuiaSaberMas:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateGuiaSaberMas communicationUpdateGuiaSaberMas:kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];

}
@end
