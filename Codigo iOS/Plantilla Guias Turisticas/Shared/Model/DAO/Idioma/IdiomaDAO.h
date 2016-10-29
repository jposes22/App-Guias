//
//  IdiomaDAO.h
//  TorresDeOeste
//
//  Created by Evelb on 14/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IdiomaDAO : NSObject
+(NSArray *)getIdiomas;
+(void)insertarIdiomas:(NSArray *)idiomas;
@end
