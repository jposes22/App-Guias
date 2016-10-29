//
//  TableIdiomaController.h
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Idioma+CoreDataClass.h"
@protocol CommunicationControllerIdioma<NSObject>
@optional
-(void)communicationIdiomaSelected:(NSInteger) index;
@end

@interface TableIdiomaController : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)id<CommunicationControllerIdioma> delegateIdioma;
@property (nonatomic, strong) NSArray * listOfIdiomas;


@end
