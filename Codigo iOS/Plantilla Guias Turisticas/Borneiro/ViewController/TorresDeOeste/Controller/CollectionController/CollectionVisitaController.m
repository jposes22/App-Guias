//
//  CollectionVisitaController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CollectionVisitaController.h"
#import "CellVisitaCollectionView.h"
#import "Guia+CoreDataProperties.h"
#import "StyleBorneiro.h"
@implementation CollectionVisitaController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _listOfGuides.count;
}

// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellVisitaCollectionView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellVisitaCollectionView" forIndexPath:indexPath];
    cell.imageViewIndex.image = [UIImage imageNamed:[NSString stringWithFormat:@"image_visita_%lu",indexPath.row+1]];
    if(_pageSelected == indexPath.row){
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }else{
        cell.imageViewIndex.image = [UIImage imageNamed:[NSString stringWithFormat:@"imagen_visita_off"]];
        
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_delegateCollection && [_delegateCollection respondsToSelector:@selector(goToPage:)]){
        [_delegateCollection goToPage:indexPath.row];
        
    }
}

@end
