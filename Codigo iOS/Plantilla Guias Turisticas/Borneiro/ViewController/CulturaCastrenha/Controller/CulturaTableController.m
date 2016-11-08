//
//  CidaBorneiroTableController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 30/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CulturaTableController.h"
#import "CellCultura.h"
#import "CellCulturaSinImagen.h"
#import "GuiaList.h"
#import "HeaderCultura.h"
@interface CulturaTableController()< ComunicationCulturaAudioGuia, ComunicatonSelectCeldaCultura>
@end
@implementation CulturaTableController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listOfDetalleGuia.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiaDetalleList * guiaList = [_listOfDetalleGuia objectAtIndex:indexPath.row];
    if(guiaList.listOfGuiaDetalleImagen.count > 0){
        static NSString *identifier = @"CellCultura";
        
        CellCultura * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
        cell.delegateCeldaCultura = self;
        [cell loadData:guiaList];
        
        
        return cell;
    }else{
        CellCulturaSinImagen * cell = [tableView dequeueReusableCellWithIdentifier:@"CellCulturaSinImagen"];
        if (!cell){
            [tableView registerNib:[UINib nibWithNibName:@"CellCulturaSinImagen" bundle:nil] forCellReuseIdentifier:@"CellCulturaSinImagen"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"CellCulturaSinImagen"];
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
    
    HeaderCultura *nibView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderCultura" owner:self options:nil] objectAtIndex:0];
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
        return 150;
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

