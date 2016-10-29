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

@interface CellGuiaDetalle()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong) GuiaDetalleImagen * guiaDetalleImagen;
@property (nonatomic, strong) NSMutableArray * listImagenesDetalle;
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
    if(!guiaDetalle.titulo){
       // [_labelTitle removeFromSuperview];
    }else{
        _labelTitle.text = guiaDetalle.titulo;
    }
    if(!guiaDetalle.descripcion){
       // [_labelDescripcion removeFromSuperview];
    }else{
        _labelDescripcion.attributedText = [Metodos convertHTMLToString:guiaDetalle.descripcion];
    }
    if(!guiaDetalle.listOfGuiaDetalleImagen || guiaDetalle.listOfGuiaDetalleImagen.count == 0){
       // [_imageGuia removeFromSuperview];
        _imageGuia.image =[UIImage imageNamed:@"slide_image1"];
    }else{
         _imageGuia.image =[UIImage imageNamed:@"slide_image2"];
       /*//[_imageGuia sd_setImageWithURL:[NSURL URLWithString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen ] placeholderImage:[UIImage imageNamed:@"slide_imagen1"]];
        [_imageGuia sd_setImageWithURL:[NSURL URLWithString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen ] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            // Get rid of the activity indicator when the image has been loaded
            _imageGuia.contentMode = UIViewContentModeScaleAspectFill;
        }];*/
        
        
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        
        
        /*NSArray * listGuiaDetalleImagen = [guiaDetalle.imagenesDetalle allObjects];
         for(GuiaDetalleImagen * imagen in listGuiaDetalleImagen){
         
         }
         
         [_imageGuia setAnimationImages:_listImagenesDetalle];
         _imageGuia.animationDuration = 30.0f;
         _imageGuia.animationRepeatCount = 0;
         [_imageGuia startAnimating];*/
    }
    
    [self loadStyle];

    
}
- (void)tapImageGuia:(UITapGestureRecognizer *)tap
{
    
}
-(void)loadStyle{
    [UtilsAppearance setStyleTitleList:_labelTitle];
    _labelTitle.textColor = [UtilsAppearance getPrimaryColor];
    [UtilsAppearance setStyleText:_labelDescripcion];
    
    
}

@end
