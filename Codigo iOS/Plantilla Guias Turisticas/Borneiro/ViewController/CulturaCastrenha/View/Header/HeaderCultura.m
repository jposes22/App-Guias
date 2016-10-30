//
//  HeaderGuia.m
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderCultura.h"
#import "StyleBorneiro.h"

@interface HeaderCultura()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageGuia;
@property (nonatomic, strong ) GuiaList * guia;
@property (nonatomic) BOOL isPlaying;
@property (weak, nonatomic) IBOutlet UIImageView *imageSection;

@end

@implementation HeaderCultura

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
    [StyleBorneiro setStyleTitleCultura:_labelTitle];

    
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
