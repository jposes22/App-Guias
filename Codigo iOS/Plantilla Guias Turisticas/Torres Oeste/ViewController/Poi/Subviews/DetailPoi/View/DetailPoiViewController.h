//
//  DetailPoiViewController.h
//  TorresDeOeste
//
//  Created by Jose Pose on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Poi+CoreDataProperties.h"
@interface DetailPoiViewController : UIViewController
@property (nonatomic) NSInteger categoryPoi;
@property (nonatomic, strong) Poi *poiSelected;
@end
