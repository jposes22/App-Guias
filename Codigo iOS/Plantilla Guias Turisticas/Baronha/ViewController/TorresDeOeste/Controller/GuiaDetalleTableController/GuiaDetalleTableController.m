//
//  GuiaDetalleTableController.m
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaDetalleTableController.h"
#import "CellGuiaDetalle.h"
#import "CellGuiaDetalleSinImagen.h"
#import "GuiaList.h"
#import "HeaderGuia.h"
@interface GuiaDetalleTableController()<ComunicationSelectCelda, ComunicationAudioGuia>
@end

@implementation GuiaDetalleTableController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaDetalleImagen.count > 0){
        static NSString *identifier = @"CellGuiaDetalle";

        CellGuiaDetalle * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaGuia = self;
        [cell loadData:guiaList];
        

        return cell;
    }else{
        CellGuiaDetalleSinImagen * cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaDetalleSinImagen"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellGuiaDetalleSinImagen" bundle:nil] forCellReuseIdentifier:@"CellGuiaDetalleSinImagen"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaDetalleSinImagen"];
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
    
    HeaderGuia *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderGuia" owner:self options:nil] objectAtIndex:0];
    if(_guia.urlAudioGuia){
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 120);
        nibView.delegateAudioGuia = self;
 
    }else{
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 70);

    }
    [nibView loadData:_guia];
    return nibView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(!_guia.urlAudioGuia){
        return 70;
    }
    return 120;
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
