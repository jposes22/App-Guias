//
//  PoiBorneiroSinglePoiTableViewCell.h
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poi+CoreDataProperties.h"

@interface PoiBorneiroSinglePoiTableViewCell : UITableViewCell
-(void) loadData:(Poi*)poi;
@end
