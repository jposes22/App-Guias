//
//  MenuDAO.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuDAO : NSObject
+(NSArray *)getMenuItems;
+(void)insertarMenuItems:(NSArray *)items;
@end
