//
//  CollectionController.h
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CommunicationCollectionCell <NSObject>
@optional
-(void)goToPage:(NSUInteger)page;
@end
@interface CollectionController : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *listOfGuides;
@property (nonatomic) NSUInteger pageSelected;

@property (nonatomic, weak) id<CommunicationCollectionCell>delegateCollection;

@end
