//
//  Menu+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Menu+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Menu (CoreDataProperties)

+ (NSFetchRequest<Menu *> *)fetchRequest;

@property (nonatomic) int16_t codeMenu;
@property (nonatomic) int64_t idMenu;
@property (nonatomic) BOOL isActivo;
@property (nonatomic) int16_t orden;

@end

NS_ASSUME_NONNULL_END
