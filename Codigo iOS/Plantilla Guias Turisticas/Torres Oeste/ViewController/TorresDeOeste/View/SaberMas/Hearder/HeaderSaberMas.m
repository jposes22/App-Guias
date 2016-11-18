//
//  HeaderSaberMas.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderSaberMas.h"
#import "UtilsAppearance.h"
#import "Settings.h"
#import "Metodos.h"
@interface HeaderSaberMas()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong ) GuiaSaberMasList * guia;
@property (weak, nonatomic) IBOutlet UILabel *labelAudioGuia;
@property (nonatomic) BOOL isPlaying;

@end
@implementation HeaderSaberMas

- (void)loadData:(GuiaSaberMasList *)guia{
    if(!guia.urlAudioGuia){
        [_imageGuia setHidden:YES];
        [_labelAudioGuia setHidden:YES];
    }else{
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageAudioGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        _guia = guia;
        _isPlaying = [[Settings sharedInstance] isPlaying];
        if(_isPlaying){
            _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_on"];
        }else{
            _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_off"];
        }
        [_imageGuia setHidden:NO];
        [_labelAudioGuia setHidden:NO];
        _labelAudioGuia.text = NSLocalizedString(@"text_audio_guia", nil);
        [UtilsAppearance setStyleSubtitleMoreInfo:_labelAudioGuia];
        _labelAudioGuia.textColor = [UtilsAppearance getPrimaryDarkColor];

    }
    _labelTitle.attributedText = [Metodos convertHTMLToString: guia.titulo];
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
