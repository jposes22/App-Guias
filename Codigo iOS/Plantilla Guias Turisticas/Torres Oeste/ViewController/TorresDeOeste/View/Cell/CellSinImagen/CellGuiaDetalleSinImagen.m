//
//  CellGuiaDetalleSinImagen.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaDetalleSinImagen.h"
#import "UtilsAppearance.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "Constants.h"
@interface CellGuiaDetalleSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightSaberMas;

@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSaberMas;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMAs;
@property (nonatomic, strong) GuiaDetalleList * guiaDetalle;
@end
@implementation CellGuiaDetalleSinImagen

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
         _labelTitle.textColor = [UIColor blackColor];
    }else{
        _labelTitle.hidden = NO;
        _labelTitle.textColor = [UIColor redColor];
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _constraintTopTitle.constant = 10;

    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopDescripcion.constant = -5;
        _labelDescripcion.textColor = [UIColor greenColor];
    }else{
        _labelDescripcion.hidden = NO;
        _constraintTopDescripcion.constant = 10;
        _labelDescripcion.textColor = [UIColor purpleColor];
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    
    if(guiaDetalle.saberMasList != nil){
        _constraintHeightSaberMas.constant = 20.5;
        _labelSaberMAs.hidden = NO;
        _labelSaberMAs.text = NSLocalizedString(@"text_saber_mas", nil);
        _imagenSaberMas.hidden = NO;
        
        UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
        tapSaberMasGesture.numberOfTapsRequired = 1;
        [_labelSaberMAs addGestureRecognizer:tapSaberMasGesture];
        [self loadStyle];
    }else{
        _labelSaberMAs.hidden = YES;
        _imagenSaberMas.hidden = YES;
        _constraintHeightSaberMas.constant = -5;
    }
    
}
-(void)loadStyle{
    [UtilsAppearance setStyleText:_labelSaberMAs];
    _labelSaberMAs.backgroundColor = [UtilsAppearance getPrimaryColor];
    
    
    
}
- (void)openSaberMas:(UITapGestureRecognizer *)tap
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO_SABER_MAS object:_guiaDetalle.saberMasList];
    
    
}




@end
