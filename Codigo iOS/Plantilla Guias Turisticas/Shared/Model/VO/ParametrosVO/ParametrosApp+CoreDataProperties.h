//
//  ParametrosApp+CoreDataProperties.h
//  TorresDeOeste
//
//  Created by Jose Pose on 21/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ParametrosApp+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ParametrosApp (CoreDataProperties)

+ (NSFetchRequest<ParametrosApp *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *clave;
@property (nullable, nonatomic, copy) NSString *valor;
@property (nonatomic) BOOL isActivo;

@end

NS_ASSUME_NONNULL_END
