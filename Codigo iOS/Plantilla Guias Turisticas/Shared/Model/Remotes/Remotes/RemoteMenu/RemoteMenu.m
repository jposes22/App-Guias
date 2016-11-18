//
//  RemoteMenu.m
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RemoteMenu.h"
#import "AFNetworking.h"
#import "HttpRequest.h"
#import "RemoteConstants.h"
#import "Settings.h"
#import "Constants.h"
#import "RemoteMenuVO.h"
#import "MenuDAO.h"


@implementation RemoteMenu
-(void)getMenu{
    
    NSString * url = [NSString stringWithFormat:@"%@/%@/%@", kURL_GET_MENU, [[Settings sharedInstance] lastUpdateMenu],[[Settings sharedInstance] idioma]];
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:url httpMethod:kGET objectToSend:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        @try {
             [[NSOperationQueue new] addOperationWithBlock:^{
            RemoteMenuVO * menuRemote = [[RemoteMenuVO alloc] initMenu:responseObject];
            [MenuDAO insertarMenuItems:menuRemote.answere];
            if(_delegateMenu && [_delegateMenu respondsToSelector:@selector(communicationUpdateMenu:)]){
                [[Settings sharedInstance] setLastUpdateMenu:menuRemote.dateTo];
                [[Settings sharedInstance] saveSettings];
                if([[menuRemote answere] count] >0 ){
                    [_delegateMenu communicationUpdateMenu:kDAO_RESPONSE_OK_WITH_DATA];
                }else{
                    [_delegateMenu communicationUpdateMenu: kDAO_RESPONSE_OK_WITHOUT_DATA];
                }
                
            }
             }];
            
        }
        @catch (NSException *exception) {
            if(_delegateMenu && [_delegateMenu respondsToSelector:@selector(communicationUpdateMenu:)]){
                [_delegateMenu communicationUpdateMenu:kDAO_RESPONSE_FAIL];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(_delegateMenu && [_delegateMenu respondsToSelector:@selector(communicationUpdateMenu:)]){
            NSString *code = [[error userInfo] objectForKey:KHEADER_WITH_CODE];
            if([code containsString:kCODE_TIMEOUT]){
                [_delegateMenu communicationUpdateMenu:kDAO_RESPONSE_TIMEOUT];
            }else{
                [_delegateMenu communicationUpdateMenu: kDAO_RESPONSE_FAIL];
            }
        }
    }
     ];
    [op start];
    
}


@end
