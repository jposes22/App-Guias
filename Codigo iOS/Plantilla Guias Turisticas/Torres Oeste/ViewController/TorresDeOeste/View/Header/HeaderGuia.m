//
//  HeaderGuia.m
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderGuia.h"
#import "UtilsAppearance.h"

@interface HeaderGuia()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong ) GuiaList * guia;
@property (nonatomic) BOOL isPlaying;
@property (weak, nonatomic) IBOutlet UILabel *labelAudioGuia;

@end

@implementation HeaderGuia

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)loadData:(GuiaList *)guia{
    if(!guia.urlAudioGuia){
        [_imageGuia setHidden:YES];
        [_labelAudioGuia setHidden:YES];
    }else{
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageAudioGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        _guia = guia;
        if(_isPlaying){
            _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_on"];
            _labelAudioGuia.textColor = [UIColor whiteColor];

        }else{
            _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_off"];
            _labelAudioGuia.textColor = [UtilsAppearance getPrimaryDarkColor];

        }
        [_imageGuia setHidden:NO];
        [_labelAudioGuia setHidden:NO];
        _labelAudioGuia.text = NSLocalizedString(@"text_audio_guia", nil);
        [UtilsAppearance setStyleSubtitleMoreInfo:_labelAudioGuia];



    }
    _labelTitle.text = guia.titulo;
    [UtilsAppearance setStyleTitle:_labelTitle];
   
    
}

- (void)tapImageAudioGuia:(UITapGestureRecognizer *)tap
{
    _isPlaying = !_isPlaying;
    if(_isPlaying){
        _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_on"];
    }else{
        _imageGuia.image = [UIImage imageNamed:@"bt_audioguia_off"];
    }
    if(_delegateAudioGuia && [_delegateAudioGuia respondsToSelector:@selector(playAudioGuia:)]){
        [_delegateAudioGuia playAudioGuia:_guia];
    }
}






@end
