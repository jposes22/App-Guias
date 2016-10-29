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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintLabelTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTopImagen;
@property (nonatomic, strong) NSArray * listImagenesDetalle;
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
        _imageGuia.image =[UIImage imageNamed:@"slide_image1"];
    }else{
<<<<<<< HEAD
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        path = [path stringByAppendingString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen];
        _imageGuia.image = [UIImage imageWithContentsOfFile:path ];
      
=======
        _listImagenesDetalle =  guiaDetalle.listOfGuiaDetalleImagen;
         _imageGuia.image =[UIImage imageNamed:@"slide_image2"];
       /*//[_imageGuia sd_setImageWithURL:[NSURL URLWithString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen ] placeholderImage:[UIImage imageNamed:@"slide_imagen1"]];
        [_imageGuia sd_setImageWithURL:[NSURL URLWithString:((GuiaDetalleImagen *)[guiaDetalle.listOfGuiaDetalleImagen firstObject]).urlImagen ] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            // Get rid of the activity indicator when the image has been loaded
            _imageGuia.contentMode = UIViewContentModeScaleAspectFill;
        }];*/
        
        
>>>>>>> fe4eebe5239da5160b58c3c251532950fee77064
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
    [UtilsAppearance setStyleTitleList:_labelTitle];
    _labelTitle.textColor = [UtilsAppearance getPrimaryColor];
    [UtilsAppearance setStyleText:_labelDescripcion];
    
    
}

@end
