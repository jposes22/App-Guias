//
//  CellGuiaDetalle.m
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaDetalle.h"
#import "UtilsAppearance.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "Constants.h"

@interface CellGuiaDetalle()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintLabelTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopImagen;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainSaberMasHeight;
@property (nonatomic, strong) GuiaDetalleList * guiaDetalle;
@property (weak, nonatomic) IBOutlet UILabel *labelSaberMas;
@property (weak, nonatomic) IBOutlet UIImageView *imagenSaberMas;



@end

@implementation CellGuiaDetalle

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
            _contraintLabelTopHeight.constant = -5;
            _labelTitle.hidden = YES;
        }else{
            _contraintLabelTopHeight.constant = 5;
            _labelTitle.attributedText = [Metodos convertHTMLToString: guiaDetalle.titulo];
            _labelTitle.hidden = NO;
        }
        if(!guiaDetalle.descripcion){
            _labelDescripcion.hidden = YES;
            _constraintTopHeight.constant = -5;
        }else{
            _constraintTopHeight.constant = 5;
            _labelDescripcion.hidden = NO;
            _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
        }
        if(!guiaDetalle.listOfGuiaDetalleImagen || guiaDetalle.listOfGuiaDetalleImagen.count == 0){
            _constraintTopImagen.constant = -5;
            _imageGuia.hidden = YES;
        }else{
            _imageGuia.hidden = NO;
            _listImagenesDetalle =  guiaDetalle.listOfGuiaDetalleImagen;
            _imageGuia.userInteractionEnabled = YES;
            _constraintTopImagen.constant = 5;
            NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [path stringByAppendingString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen];
            _imageGuia.image = [UIImage imageWithContentsOfFile:path ];
            UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageGuia:)];
            tapGestureRecognizer.numberOfTapsRequired = 1;
            [_imageGuia addGestureRecognizer:tapGestureRecognizer];
            
            if(guiaDetalle.saberMasList != nil){
                _constrainSaberMasHeight.constant = 20.5;
                _labelSaberMas.hidden = NO;
                _imagenSaberMas.hidden = NO;
                _labelSaberMas.text = NSLocalizedString(@"text_saber_mas", nil);

                UITapGestureRecognizer * tapSaberMasGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openSaberMas:)];
                tapSaberMasGesture.numberOfTapsRequired = 1;
                [_labelSaberMas addGestureRecognizer:tapSaberMasGesture];
            }else{
                _labelSaberMas.hidden = YES;
                _imagenSaberMas.hidden = YES;
                 _constrainSaberMasHeight.constant = -5;
            }
            
            
            
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
    [UtilsAppearance setStyleText:_labelSaberMas];
    _labelSaberMas.backgroundColor = [UtilsAppearance getPrimaryColor];

    
    
}

@end
