//
//  Validator.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Validator.h"

@implementation Validator

+(BOOL) validateEmail:(NSString*) email{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+(BOOL) validatePhone:(NSString*) phone{
    NSString *phoneRegex = @"^[0-9]{9}$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:phone];
}


+(BOOL) validateWeb:(NSString*) urlWeb{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:urlWeb];
}

+(BOOL) validatePositionGPS:(double) latitud andLongitud:(double)longitud{
    if(latitud > -90 && latitud < 90){
        if(longitud > -180  && longitud < 180){
            if( longitud != 0.0 && latitud != 0.0){
                return YES;
            }
        }
    }
    return NO;

}
@end
