//
//  CellGuiaSaberMasSinImagen.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaSaberMasSinImagenBorneiro.h"
#import "UtilsAppearance.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface CellGuiaSaberMasSinImagenBorneiro()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMas;
@property (weak, nonatomic) IBOutlet UIImageView *imageSaberMas;
@end
@implementation CellGuiaSaberMasSinImagenBorneiro

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadData:(GuiaSaberMasDetalleList *)guiaDetalle{
    if(!guiaDetalle.titulo){
        _constraintTopTitle.constant = -5;
        _labelTitle.hidden = YES;
    }else{
        _labelTitle.hidden = NO;
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _constraintTopTitle.constant = 5;
        
    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopDescripcion.constant = -5;
    }else{
        _labelDescripcion.hidden = NO;
        _constraintTopDescripcion.constant = 5;
        
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    
    
}

@end
