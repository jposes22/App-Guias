//
//  CellGuiaDetalle.h
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaDetalleList.h"
@protocol ComunicatonSelectCeldaCultura <NSObject>
@optional
- (void) imageSelected:(NSArray *)listImage;
@end
@interface CellCultura: UITableViewCell
- (void)loadData:(GuiaDetalleList *)guiaDetalle;
@property (nonatomic, weak) id<ComunicatonSelectCeldaCultura> delegateCeldaCultura;

@end
