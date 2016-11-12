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
@interface CellGuiaDetalleSinImagen()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopDescripcion;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
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
    if(!guiaDetalle.titulo){
        _constraintTopTitle.constant = 0;
        _labelTitle.hidden = YES;
    }else{
        _labelTitle.hidden = NO;
        _labelTitle.attributedText = [Metodos convertHTMLToString:guiaDetalle.titulo];
        _constraintTopTitle.constant = 10;

    }
    if(!guiaDetalle.descripcion){
        _labelDescripcion.hidden = YES;
        _constraintTopDescripcion.constant = 0;
    }else{
        _labelDescripcion.hidden = NO;
        _constraintTopDescripcion.constant = 10;

        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    
    [self loadStyle];
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    
}
-(void)loadStyle{
    //[UtilsAppearance setStyleTitleList:_labelTitle];
    //_labelTitle.textColor = [UtilsAppearance getPrimaryColor];
   // [UtilsAppearance setStyleText:_labelDescripcion];
    
    
}


@end
