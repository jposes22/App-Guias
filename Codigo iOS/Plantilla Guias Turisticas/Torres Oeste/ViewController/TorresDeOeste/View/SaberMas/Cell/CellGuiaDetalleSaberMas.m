//
//  CellGuiaDetalleSaberMas.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellGuiaDetalleSaberMas.h"
#import "UtilsAppearance.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaSaberMasDetalleImagen+CoreDataProperties.h"
#import "GuiaSaberMasDetalleImagenDAO.h"
@interface CellGuiaDetalleSaberMas()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopSublabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopImagen;
@property (nonatomic, strong) GuiaSaberMasDetalleList * guiaDetalle;

@end
@implementation CellGuiaDetalleSaberMas

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
        _constraintTopLabel.constant = 0;
        _labelTitle.hidden = YES;
    }else{
        _constraintTopLabel.constant = 10;
        _labelTitle.attributedText = [Metodos convertHTMLToString: guiaDetalle.titulo];
        _labelTitle.hidden = NO;
    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopSublabel.constant = 0;
    }else{
        _constraintTopSublabel.constant = 10;
        _labelDescripcion.hidden = NO;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(!guiaDetalle.listOfGuiaSaberMasDetalleImagen || guiaDetalle.listOfGuiaSaberMasDetalleImagen.count == 0){
        _constraintTopImagen.constant = 0;
        _imageGuia.hidden = YES;
    }else{
        _imageGuia.hidden = NO;
        _listImagenesDetalle =  guiaDetalle.listOfGuiaSaberMasDetalleImagen;
        _imageGuia.userInteractionEnabled = YES;
        _constraintTopImagen.constant = 10;
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        path = [path stringByAppendingString:((GuiaSaberMasDetalleImagen *)[guiaDetalle.listOfGuiaSaberMasDetalleImagen firstObject]).urlImagen];
        _imageGuia.image = [UIImage imageWithContentsOfFile:path ];
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        
    }
    
    
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    if(_delegateCeldaGuia && [_delegateCeldaGuia respondsToSelector:@selector(imageSelected:)]){
        [_delegateCeldaGuia imageSelected:_listImagenesDetalle];
    }
    
    
}

@end
