//
//  PoiTableController.h
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CommunicationControllerPoiBorneiro<NSObject>
@optional
-(void)communicationPoiSelected:(NSInteger) index;
@end

@interface PoiBorneiroTableController : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<CommunicationControllerPoiBorneiro> delegatePoi;
@property (nonatomic, strong) NSArray *listOfPois;
@property (nonatomic) Boolean isSinglePoi;
@end
