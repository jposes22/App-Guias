//
//  NavigationBar.m
//  TorresDeOeste
//
//  Created by Evelb on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "NavigationBar.h"
#import "UtilsAppearance.h"
@interface NavigationBar()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;

@end
@implementation NavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)initView:(NSString *)title{
    _labelTitle.textColor = [UtilsAppearance getPrimaryColor];
    [UtilsAppearance setStyleText:_labelTitle];
    _labelTitle.text = title;
    
    [_btnMenu setBackgroundImage:[UIImage imageNamed:@"btnMenu"] forState:UIControlStateNormal];
    [_btnMenu setTintColor:[UtilsAppearance getPrimaryDarkColor]];
    _imageView.clipsToBounds = YES;
    [_imageView setImage:[UIImage imageNamed:@"triangulo_barra"]];
    [_viewBottom setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    
    
}
- (IBAction)btnMenuTouch {
    if(_delegateNavigationBar && [_delegateNavigationBar respondsToSelector:@selector(openMenu)]){
        [_delegateNavigationBar openMenu];
    }
}

@end
