//
//  HeaderSaberMas.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderSaberMas.h"
#import "UtilsAppearance.h"
@interface HeaderSaberMas()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong ) GuiaSaberMasList * guia;
@property (nonatomic) BOOL isPlaying;

@end
@implementation HeaderSaberMas

- (void)loadData:(GuiaSaberMasList *)guia{
    if(!guia.urlAudioGuia){
        [_imageGuia removeFromSuperview];
    }else{
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageAudioGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        _guia = guia;
    }
    _labelTitle.text = guia.titulo;
    [UtilsAppearance setStyleTitle:_labelTitle];
    _labelTitle.textColor = [UtilsAppearance getPrimaryDarkColor];
    
    
}

- (void)tapImageAudioGuia:(UITapGestureRecognizer *)tap
{
    _isPlaying = !_isPlaying;
    if(_isPlaying){
        _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_on"];
    }else{
        _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_off"];
    }
    if(_delegateAudioGuiaSaberMas && [_delegateAudioGuiaSaberMas respondsToSelector:@selector(playAudioGuia:)]){
        [_delegateAudioGuiaSaberMas playAudioGuia:_guia];
    }
}


@end
