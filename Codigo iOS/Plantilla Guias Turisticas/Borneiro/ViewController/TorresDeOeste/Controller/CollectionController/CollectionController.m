//
//  CollectionController.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CollectionController.h"
#import "CellGuiaCollectionView.h"
#import "Guia+CoreDataProperties.h"
#import "UtilsAppearance.h"

@implementation CollectionController
#pragma mark - Collection View Data Sources

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _listOfGuides.count;
}

// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellGuiaCollectionView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellGuiaCollectionView" forIndexPath:indexPath];
    cell.labelTitle.text =((Guia *)[_listOfGuides objectAtIndex:indexPath.row]).titulo;
    [UtilsAppearance setStyleTextBold:cell.labelTitle];
    cell.labelTitle.textColor = [UIColor whiteColor];
    if(_pageSelected == indexPath.row){
        cell.backgroundColor = [UtilsAppearance getPrimaryDarkColor];
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    }else{
        cell.backgroundColor = [UtilsAppearance getPrimaryColor];

    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_delegateCollection && [_delegateCollection respondsToSelector:@selector(goToPage:)]){
        [_delegateCollection goToPage:indexPath.row];
        
    }
}
@end
