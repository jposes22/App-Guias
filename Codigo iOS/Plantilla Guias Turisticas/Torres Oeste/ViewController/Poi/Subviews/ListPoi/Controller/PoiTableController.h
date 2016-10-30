//
//  PoiTableController.h
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Poi+CoreDataProperties.h"

@protocol CommunicationControllerPoi<NSObject>
@optional
-(void)communicationPoiSelected:(Poi *) poiSelected;
@end

@interface PoiTableController : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<CommunicationControllerPoi> delegatePoi;
@property (nonatomic, strong) NSArray *listOfPois;
@end
