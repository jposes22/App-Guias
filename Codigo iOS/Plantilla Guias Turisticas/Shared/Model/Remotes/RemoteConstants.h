//
//  RemoteConstants.h
//  TorresDeOeste
//
//  Created by Evelb on 11/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteConstants : NSObject

enum {
    kDAO_RESPONSE_TIMEOUT = 0,
    kDAO_RESPONSE_OK_WITH_DATA = 1,
    kDAO_RESPONSE_OK_WITHOUT_DATA = 2,
    kDAO_RESPONSE_FAIL = 3,
    kDAO_INVALID_LOGIN = 4,
    kDAO_RESPONSE_FAIL_AND_RESET_COREDATA = -99
};
typedef int DAO_RESPONSE;

extern NSString *const kREMOTE_VO_ANSWERE;
extern NSString *const kREMOTE_VO_DATE_FROM;
extern NSString *const kREMOTE_VO_DATE_TO;


extern NSString *const kPOST;
extern NSString *const kGET;

extern NSString *const KHEADER_WITH_CODE;
extern NSString *const kCODE_TIMEOUT;
extern NSString *const kCODE_UNAUTHORIZED;
extern NSString *const kCODE_FORBIDEN;

@end
