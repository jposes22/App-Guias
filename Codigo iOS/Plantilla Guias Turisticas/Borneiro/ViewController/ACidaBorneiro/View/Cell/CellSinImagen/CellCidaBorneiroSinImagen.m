//
//  CellGuiaDetalleSinImagen.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellCidaBorneiroSinImagen.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "Constants.h"
@interface CellCidaBorneiroSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainHeightSaberMas;

@property (weak, nonatomic) IBOutlet UIImageView *imagenSaberMas;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMas;
@property (nonatomic, strong) GuiaDetalleList * guiaDetalle;

@end
@implementation CellCidaBorneiroSinImagen

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadData:(GuiaDetalleList *)guiaDetalle{
    _guiaDetalle = guiaDetalle;
    if(!guiaDetalle.titulo){
        _labelTitle.hidden = YES;
        _constraintTopTitle.constant = -5;
    }else{
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _labelTitle.hidden = NO;
        _constraintTopTitle.constant = 5;

    }
    if(!guiaDetalle.descripcion){
        _constraintTopDescripcion.constant = -5;
        _labelDescripcion.hidden = YES;
    }else{
        _constraintTopDescripcion.constant = 5;
        _labelDescripcion.hidden = NO;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(guiaDetalle.saberMasList != nil){
        _labelSaberMas.hidden = NO;
        _imagenSaberMas.hidden = NO;
        _labelSaberMas.text = NSLocalizedString(@"text_saber_mas", nil);
        _constrainHeightSaberMas.constant = 20.5;
        UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
        tapSaberMasGesture.numberOfTapsRequired = 1;
        [_labelSaberMas addGestureRecognizer:tapSaberMasGesture];
    }else{
        _constrainHeightSaberMas.constant = 0;
       // _labelSaberMas.hidden = YES;
        _imagenSaberMas.hidden = YES;
    }

    
    [self loadStyle];
    
}
- (void)openSaberMas:(UITapGestureRecognizer *)tap
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO_SABER_MAS object:_guiaDetalle.saberMasList];
    
    
}

-(void)loadStyle{
    [StyleBorneiro setStyleText:_labelSaberMas];
    _labelSaberMas.textColor = [UIColor whiteColor];

    
}


@end
