//
//  SaberMasTableController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SaberMasBorneiroTableController.h"
#import "CellGuiaDetalleSaberMasBorneiro.h"
#import "CellGuiaSaberMasSinImagenBorneiro.h"
#import "GuiaSaberMasList.h"
#import "HeaderSaberMasBorneiro.h"
@interface SaberMasBorneiroTableController()<ComunicationAudioGuiaSaberMas, ComunicationSelectCeldaSaberMas>
@end
@implementation SaberMasBorneiroTableController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaSaberMasDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaSaberMasDetalleImagen.count > 0){
        static NSString *identifier = @"CellGuiaDetalleSaberMasBorneiro";
        
        CellGuiaDetalleSaberMasBorneiro * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaGuia = self;
        [cell loadData:guiaList];
        
        
        return cell;
    }else{
        CellGuiaSaberMasSinImagenBorneiro * cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaSaberMasSinImagenBorneiro"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellGuiaSaberMasSinImagenBorneiro" bundle:nil] forCellReuseIdentifier:@"CellGuiaSaberMasSinImagenBorneiro"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaSaberMasSinImagenBorneiro"];
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
    
    HeaderSaberMasBorneiro *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderSaberMasBorneiro" owner:self options:nil] objectAtIndex:0];
    if(_guia.urlAudioGuia){
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 200);
        nibView.delegateAudioGuiaSaberMas = self;
        
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
- (void) playAudioGuia:(GuiaSaberMasList *)guia{
    if(_delegateTableController && [_delegateTableController respondsToSelector:@selector(comunicationPlayAudioGuia:)]){
        [_delegateTableController comunicationPlayAudioGuia:guia];
    }
    
}

@end
