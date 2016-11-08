//
//  CellGuiaDetalle.m
//  TorresDeOeste
//
//  Created by Evelb on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CellCidaBorneiro.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GuiaDetalleImagen+CoreDataProperties.h"
#import "GuiaDetalleImagenDAO.h"
#import "GuiaDetalleImagen+CoreDataProperties.h"

@interface CellCidaBorneiro()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) GuiaDetalleImagen * guiaDetalleImagen;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintLabelTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopImagen;
@end

@implementation CellCidaBorneiro

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
        _labelTitle.text = guiaDetalle.titulo;
        _labelTitle.hidden = NO;
    }
    if(!guiaDetalle.descripcion){
        _constraintTopHeight.constant = 0;
        _labelDescripcion.hidden = YES;
    }else{
        _constraintTopHeight.constant = 10;
        _labelDescripcion.hidden = NO;
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(!guiaDetalle.listOfGuiaDetalleImagen || guiaDetalle.listOfGuiaDetalleImagen.count == 0){
		_constraintTopImagen.constant = 0;
        _imageGuia.hidden = YES;
        //_imageGuia.image =[UIImage imageNamed:@"slide_image1"];
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
    
    [self loadStyle];

    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    if(_delegateCeldaCida && [_delegateCeldaCida respondsToSelector:@selector(imageSelected:)]){
        [_delegateCeldaCida imageSelected:_listImagenesDetalle];
    }
 
    
}
-(void)loadStyle{
    [StyleBorneiro setStyleSubTitleCida:_labelTitle];
   // [StyleBorneiro setStyleText:_labelDescripcion];
    
    
}

@end
