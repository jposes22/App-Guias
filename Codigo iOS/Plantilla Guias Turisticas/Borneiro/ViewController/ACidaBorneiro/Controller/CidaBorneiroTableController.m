//
//  CidaBorneiroTableController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 30/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CidaBorneiroTableController.h"
#import "CellCidaBorneiro.h"
#import "CellCidaBorneiroSinImagen.h"
#import "GuiaList.h"
#import "HeaderCida.h"
@interface CidaBorneiroTableController()<ComunicationSelectCelCidaBorneiro, ComunicationCidaAudioGuia>
@end
@implementation CidaBorneiroTableController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaDetalleImagen.count > 0){
        static NSString *identifier = @"CellCidaBorneiro";
        
        CellCidaBorneiro * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaCida = self;
        [cell loadData:guiaList];
        
        
        return cell;
    }else{
        CellCidaBorneiroSinImagen * cell = [tableView dequeueReusableCellWithIdentifier:@"CellCidaBorneiroSinImagen"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellCidaBorneiroSinImagen" bundle:nil] forCellReuseIdentifier:@"CellCidaBorneiroSinImagen"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellCidaBorneiroSinImagen"];
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
    
    HeaderCida *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderCida" owner:self options:nil] objectAtIndex:0];
    if(_guia.urlAudioGuia){
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 200);
        nibView.delegateAudioGuia = self;
        
    }else{
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 170);
        
    }
    [nibView loadData:_guia];
    return nibView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(!_guia.urlAudioGuia){
        return 170;
    }
    return 200;
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

