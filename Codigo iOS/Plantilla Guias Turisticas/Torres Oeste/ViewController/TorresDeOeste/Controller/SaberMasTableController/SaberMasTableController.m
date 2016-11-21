//
//  SaberMasTableController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SaberMasTableController.h"
#import "CellGuiaDetalleSaberMas.h"
#import "CellGuiaSaberMasSinImagen.h"
#import "GuiaSaberMasList.h"
#import "HeaderSaberMas.h"
@interface SaberMasTableController()<ComunicationAudioGuiaSaberMas, ComunicationSelectCeldaSaberMas>
@end
@implementation SaberMasTableController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaSaberMasDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaSaberMasDetalleImagen.count > 0){
        static NSString *identifier = @"CellGuiaDetalleSaberMas";
        
        CellGuiaDetalleSaberMas * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaGuia = self;
        [cell loadData:guiaList];
        
        
        return cell;
    }else{
        CellGuiaSaberMasSinImagen * cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaSaberMasSinImagen"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellGuiaSaberMasSinImagen" bundle:nil] forCellReuseIdentifier:@"CellGuiaSaberMasSinImagen"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellGuiaSaberMasSinImagen"];
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
    
    HeaderSaberMas *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderSaberMas" owner:self options:nil] objectAtIndex:0];
    if(_guia.urlAudioGuia){
        nibView.frame = CGRectMake(0, 0, tableView.frame.size.width, 120);
        nibView.delegateAudioGuiaSaberMas = self;
        
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
- (void) playAudioGuia:(GuiaSaberMasList *)guia{
    if(_delegateTableController && [_delegateTableController respondsToSelector:@selector(comunicationPlayAudioGuia:)]){
        [_delegateTableController comunicationPlayAudioGuia:guia];
    }
    
}

@end
