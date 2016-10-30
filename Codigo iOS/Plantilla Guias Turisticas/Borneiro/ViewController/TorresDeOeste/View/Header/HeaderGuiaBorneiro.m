//
//  HeaderGuiaBorneiro.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderGuiaBorneiro.h"
#import "StyleBorneiro.h"
@interface HeaderGuiaBorneiro()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong ) GuiaList * guia;
@property (nonatomic) BOOL isPlaying;
@end

@implementation HeaderGuiaBorneiro

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)loadData:(GuiaList *)guia{
    if(!guia.urlAudioGuia){
        [_imageGuia removeFromSuperview];
    }else{
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImageAudioGuia:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [_imageGuia addGestureRecognizer:tapGestureRecognizer];
        _guia = guia;
    }
    _labelTitle.text = guia.titulo;
    [StyleBorneiro setStyleTitleVisita:_labelTitle];
}

- (void)tapImageAudioGuia:(UITapGestureRecognizer *)tap
{
    _isPlaying = !_isPlaying;
    if(_isPlaying){
        _imageGuia.image = [UIImage imageNamed:@"ic_audioguia_on"];
    }else{
        _imageGuia.image = [UIImage imageNamed:@"ic_audioguia_off"];
        
    }
    if(_delegateAudioGuia && [_delegateAudioGuia respondsToSelector:@selector(playAudioGuia:)]){
        [_delegateAudioGuia playAudioGuia:_guia];
    }
    
    
}


@end
