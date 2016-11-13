//
//  CellGuiaDetalleSaberMas.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuiaSaberMasDetalleList.h"
@protocol ComunicationSelectCeldaSaberMas <NSObject>
@optional
- (void) imageSelected:(NSArray *)listImage;
@end
@interface CellGuiaDetalleSaberMas : UITableViewCell
- (void)loadData:(GuiaSaberMasDetalleList *)guiaDetalle;
@property (nonatomic, weak) id<ComunicationSelectCeldaSaberMas> delegateCeldaGuia;

@end
