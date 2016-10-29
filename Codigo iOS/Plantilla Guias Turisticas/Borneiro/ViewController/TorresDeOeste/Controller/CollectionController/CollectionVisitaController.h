//
//  CollectionVisitaController.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CommunicationCollectionVisitaCell <NSObject>
@optional
-(void)goToPage:(NSUInteger)page;
@end
@interface CollectionVisitaController : NSObject<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *listOfGuides;
@property (nonatomic) NSUInteger pageSelected;

@property (nonatomic, weak) id<CommunicationCollectionVisitaCell>delegateCollection;

@end
