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
@interface CellGuiaBorneiroDetalle()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) GuiaDetalleImagen * guiaDetalleImagen;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintLabelTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopHeight;
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
    }else{
        _contraintLabelTopHeight.constant = 10;
        _labelTitle.text = guiaDetalle.titulo;
    }
    if(!guiaDetalle.descripcion){
        _constraintTopHeight.constant = 0;
    }else{
        _constraintTopHeight.constant = 10;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(!guiaDetalle.listOfGuiaDetalleImagen || guiaDetalle.listOfGuiaDetalleImagen.count == 0){
        _constraintTopImagen.constant = 0;
    }else{
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
    
    [self loadStyle];
    
    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    if(_delegateCeldaGuia && [_delegateCeldaGuia respondsToSelector:@selector(imageSelected:)]){
        [_delegateCeldaGuia imageSelected:_listImagenesDetalle];
    }
    
    
}
-(void)loadStyle{
    [StyleBorneiro setStyleSubTitleVisita:_labelTitle];
    [StyleBorneiro setStyleText:_labelDescripcion];
    
    
}


@end
