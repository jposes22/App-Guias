//
//  DetalleVisitaTableController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "DetalleVisitaTableController.h"
#import "CellGuiaBorneiroDetalle.h"
#import "CellGuiaBorneiroDetalleSinImagen.h"
#import "GuiaList.h"
#import "HeaderGuiaBorneiro.h"
@interface DetalleVisitaTableController()<ComunicationAudioGuiaBorneiro, ComunicationSelectellGuiaBorneiro>
@end
@implementation DetalleVisitaTableController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaDetalleImagen.count > 0){
        static NSString *identifier = @"CellGuiaBorneiroDetalle";
        
        CellGuiaBorneiroDetalle * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaGuia = self;
        [cell loadData:guiaList];
        
        
        return cell;
    }else{
        CellGuiaBorneiroDetalleSinImagen * cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaBorneiroDetalleSinImagen"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellGuiaBorneiroDetalleSinImagen" bundle:nil] forCellReuseIdentifier:@"CellGuiaBorneiroDetalleSinImagen"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaBorneiroDetalleSinImagen"];
        }
        [cell loadData:guiaList];
        return cell;
    }
}
- (void) imageSelected:(NSArray *)listImage{
    if(_delegateTableController && [_delegateTableController respondsToSelector:@selector(communicationImageSelected:)]){
        [_delegateTableController communicationImageSelected:listImage];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HeaderGuiaBorneiro *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderGuiaBorneiro" owner:self options:nil] objectAtIndex:0];
    if(_guia.urlAudioGuia){
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 100);
        nibView.delegateAudioGuia = self;
        
    }else{
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 50);
        
    }
    [nibView loadData:_guia];
    return nibView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(!_guia.urlAudioGuia){
        return 50;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void) playAudioGuia:(GuiaList *)guia{
    if(_delegateTableController && [_delegateTableController respondsToSelector:@selector(comunicationPlayAudioGuia:)]){
        [_delegateTableController comunicationPlayAudioGuia:guia];
    }
    
}

@end
