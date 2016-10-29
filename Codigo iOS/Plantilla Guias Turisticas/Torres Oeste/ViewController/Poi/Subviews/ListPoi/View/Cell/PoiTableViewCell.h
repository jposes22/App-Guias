//
//  PoiTableViewCell.h
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poi+CoreDataProperties.h"
@interface PoiTableViewCell : UITableViewCell

-(void) loadData:(Poi*)poi;
@end
