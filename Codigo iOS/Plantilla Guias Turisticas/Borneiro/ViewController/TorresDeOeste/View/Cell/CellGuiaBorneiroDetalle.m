//
//  CellGuiaBorneiroDetalle.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaBorneiroDetalle.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "Constants.h"
@interface CellGuiaBorneiroDetalle()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) GuiaDetalleImagen * guiaDetalleImagen;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintLabelTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopHeight;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMas;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSaberMas;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopImagen;
@end

@implementation CellGuiaBorneiroDetalle

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
        _contraintLabelTopHeight.constant = 0;
        _labelTitle.hidden = YES;
    }else{
        _contraintLabelTopHeight.constant = 10;
        _labelTitle.text = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _labelTitle.hidden = NO;
    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopHeight.constant = 0;
    }else{
        _labelDescripcion.hidden = NO;
        _constraintTopHeight.constant = 10;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(!guiaDetalle.listOfGuiaDetalleImagen || guiaDetalle.listOfGuiaDetalleImagen.count == 0){
        _constraintTopImagen.constant = 0;
        _imageGuia.hidden = YES;
    }else{
        _imageGuia.hidden = NO;
        _listImagenesDetalle =  guiaDetalle.listOfGuiaDetalleImagen;
        _imageGuia.userInteractionEnabled = YES;
        _constraintTopImagen.constant = 10;
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        path = [path stringByAppendingString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen];
        _imageGuia.image = [UIImage imageWithContentsOfFile:path ];
        
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        
    }
    if(guiaDetalle.saberMasList != nil){
        _labelSaberMas.hidden = NO;
        _imagenSaberMas.hidden = NO;
        _labelSaberMas.text = NSLocalizedString(@"text_saber_mas", nil);
        
        
        UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
        tapSaberMasGesture.numberOfTapsRequired = 1;
        [_labelSaberMas addGestureRecognizer:tapSaberMasGesture];
    }else{
        _labelSaberMas.hidden = YES;
        _imagenSaberMas.hidden = YES;
    }

    [self loadStyle];
    
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    if(_delegateCeldaGuia && [_delegateCeldaGuia respondsToSelector:@selector(imageSelected:)]){
        [_delegateCeldaGuia imageSelected:_listImagenesDetalle];
    }
    
    
}
- (void)openSaberMas:(UITapGestureRecognizer *)tap
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO_SABER_MAS object:_guiaDetalle.saberMasList];
    
    
}
-(void)loadStyle{
     [StyleBorneiro setStyleText:_labelSaberMas];
    
}


@end
