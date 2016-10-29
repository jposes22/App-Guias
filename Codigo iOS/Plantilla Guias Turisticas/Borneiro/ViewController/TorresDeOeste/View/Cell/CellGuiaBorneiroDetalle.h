//
//  CellGuiaBorneiroDetalle.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GuiaDetalleList.h"
@protocol ComunicationSelectellGuiaBorneiro <NSObject>
@optional
- (void) imageSelected:(NSArray *)listImage;
@end
@interface CellGuiaBorneiroDetalle : UITableViewCell
- (void)loadData:(GuiaDetalleList *)guiaDetalle;
@property (nonatomic, weak) id<ComunicationSelectellGuiaBorneiro> delegateCeldaGuia;
@end
