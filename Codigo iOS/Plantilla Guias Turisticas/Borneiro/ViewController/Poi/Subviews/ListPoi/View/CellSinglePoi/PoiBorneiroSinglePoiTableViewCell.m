//
//  PoiBorneiroSinglePoiTableViewCell.m
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiBorneiroSinglePoiTableViewCell.h"
#import "Constants.h"
#import "Validator.h"
#import "StyleBorneiro.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PoiBorneiroSinglePoiTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;


@property (nonatomic, strong) Poi *poi;
@end
@implementation PoiBorneiroSinglePoiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) loadData:(Poi*)poi{
    _poi = poi;
    _lblTitle.attributedText = [Metodos convertHTMLToString: poi.titulo];
    _lblDescription.attributedText = [Metodos convertHTMLToString:poi.descripcion];
    if(poi.urlImagen){
        [_imgView sd_setImageWithURL:[[NSURL alloc] initWithString:poi.urlImagen] placeholderImage:[UIImage imageNamed:@"image_none" ]];
    }else{
        [_imgView setImage:[UIImage imageNamed:@"image_none"]];
    }
    
}
@end
