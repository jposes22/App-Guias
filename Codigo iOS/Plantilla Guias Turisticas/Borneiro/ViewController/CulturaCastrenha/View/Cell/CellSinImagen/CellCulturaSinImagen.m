//
//  CellGuiaDetalleSinImagen.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellCulturaSinImagen.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "Constants.h"
@interface CellCulturaSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (nonatomic, strong) GuiaDetalleList * guiaDetalle;
@property (weak, nonatomic) IBOutlet UIImageView *imageSaberMas;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMas;
@end
@implementation CellCulturaSinImagen

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
        _labelTitle.hidden = YES;
        _constraintTopTitle.constant = 0;
    }else{
        _labelTitle.hidden = NO;
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _constraintTopTitle.constant = 10;

    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopDescripcion.constant = 0;
    }else{
        _constraintTopDescripcion.constant = 10;
        _labelDescripcion.hidden = NO;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(guiaDetalle.saberMasList != nil){
        _labelSaberMas.hidden = NO;
        _imageSaberMas.hidden = NO;
        _labelSaberMas.text = NSLocalizedString(@"text_saber_mas", nil);
        
        
        UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
        tapSaberMasGesture.numberOfTapsRequired = 1;
        [_labelSaberMas addGestureRecognizer:tapSaberMasGesture];
    }else{
        _labelSaberMas.hidden = YES;
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
    [StyleBorneiro setStyleText:_labelSaberMas];
    _labelSaberMas.textColor = [UIColor whiteColor];

    
}


@end
