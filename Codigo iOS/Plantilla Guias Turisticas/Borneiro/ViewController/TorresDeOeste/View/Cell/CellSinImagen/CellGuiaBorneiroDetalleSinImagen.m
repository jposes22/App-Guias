//
//  CellGuiaDetalleSinImagen.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaBorneiroDetalleSinImagen.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
@interface CellGuiaBorneiroDetalleSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@end
@implementation CellGuiaBorneiroDetalleSinImagen

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadData:(GuiaDetalleList *)guiaDetalle{
    if(!guiaDetalle.titulo){
        _constraintTopTitle.constant = 0;
    }else{
        _labelTitle.text = guiaDetalle.titulo;
        _constraintTopTitle.constant = 10;

    }
    if(!guiaDetalle.descripcion){
        _constraintTopDescripcion.constant = 0;
    }else{
        _constraintTopDescripcion.constant = 10;

        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    
    [self loadStyle];
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    
}
-(void)loadStyle{
    [StyleBorneiro setStyleSubTitleVisita:_labelTitle];
    [StyleBorneiro setStyleText:_labelDescripcion];
    
    
}


@end