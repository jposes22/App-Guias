//
//  PoiTableController.h
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Poi+CoreDataClass.h"

@protocol CommunicationControllerPoiBorneiro<NSObject>
@optional
-(void)communicationPoiSelected:(Poi *) poi;
@end

@interface PoiBorneiroTableController : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<CommunicationControllerPoiBorneiro> delegatePoi;
@property (nonatomic, strong) NSArray *listOfPois;
@property (nonatomic) BOOL isSinglePoi;
@end
