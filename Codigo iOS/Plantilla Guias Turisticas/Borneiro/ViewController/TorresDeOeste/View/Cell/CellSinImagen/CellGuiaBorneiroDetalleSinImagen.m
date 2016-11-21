//
//  CellGuiaDetalleSinImagen.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaBorneiroDetalleSinImagen.h"
#import "StyleBorneiro.h"
#import "Constants.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
@interface CellGuiaBorneiroDetalleSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainsHeightSaberMas;

@property (weak, nonatomic) IBOutlet UILabel *labelSaberMAs;
@property (weak, nonatomic) IBOutlet UIImageView *imageSaberMas;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (nonatomic, strong) GuiaDetalleList * guiaDetalle;

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
    _guiaDetalle = guiaDetalle;
    if(!guiaDetalle.titulo){
        _constraintTopTitle.constant = -5;
        _labelTitle.hidden = YES;
    }else{
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _constraintTopTitle.constant = 5;
        _labelTitle.hidden = NO;
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
        _labelSaberMAs.hidden = NO;
        _imageSaberMas.hidden = NO;
        _labelSaberMAs.text = NSLocalizedString(@"text_saber_mas", nil);
        _constrainsHeightSaberMas.constant = 20.5;
        
        UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
        tapSaberMasGesture.numberOfTapsRequired = 1;
        [_labelSaberMAs addGestureRecognizer:tapSaberMasGesture];
    }else{
        _constrainsHeightSaberMas.constant = -5;
        _labelSaberMAs.hidden = YES;
        _imageSaberMas.hidden = YES;
    }

    
    [self loadStyle];
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    
}
- (void)openSaberMas:(UITapGestureRecognizer *)tap
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO_SABER_MAS object:_guiaDetalle.saberMasList];
    
    
}
-(void)loadStyle{
    [StyleBorneiro setStyleText:_labelSaberMAs];
    _labelSaberMAs.textColor = [UIColor whiteColor];

}



@end
