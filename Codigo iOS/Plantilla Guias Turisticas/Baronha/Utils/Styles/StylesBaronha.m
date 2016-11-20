//
//  StylesBaronha.m
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "StylesBaronha.h"
#import <UIKit/UIKit.h>

@implementation StylesBaronha


+(UIColor * )getPrimaryColor{
    return [UIColor colorWithRed:51.0/255.0 green:157.0/255.0 blue:182.0/255.0 alpha:1.0];
}
+(UIColor * )getPrimaryLightColor{
    return [UIColor colorWithRed:25.0/255.0 green:187.0/255.0 blue:216.0/255.0 alpha:1.0];
}
+(UIColor * )getSecondaryColor{
    return [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
}

+(UIColor * )getThirdColor{
    return [UIColor colorWithRed:91.0/255.0 green:91.0/255.0 blue:95.0/255.0 alpha:1.0];
}
+ (void)setStyleTitlePoi:(UILabel *)label{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ){
        [label setFont:[UIFont fontWithName:@"Santana" size:30]];
    }else{
        [label setFont:[UIFont fontWithName:@"Santana" size:20]];
    }

}

+ (void)setStyleTitle:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Santana" size:30]];
    label.textColor = [StylesBaronha getPrimaryColor];
    
}
+ (void)setStyleTitleWhite:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Santana" size:25]];
    label.textColor = [UIColor whiteColor];
    
}
+ (void)setSytleSubtitle:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Santana" size:15]];
    
}
+ (void)setStyleText:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:15]];
    
    
}
+ (void)setStyleTextBold:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Bold" size:12]];
    
    
}
+ (void)setStyleButtonText:(UIButton *) button{
    [button.titleLabel setFont:[UIFont fontWithName:@"Santana" size:15]];
}
+ (void)setStyleTitleList:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:20]];
    label.textColor = [StylesBaronha getPrimaryColor];
    
}
+ (void)setSytleSubtitleList:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:15]];
    
    
}
+ (void)setStyleSubtitleMoreInfo:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"CaviarDreams-Bold" size:12]];
    
    
}

+(void)setCircleView:(UIView *) view{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 1.0;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(1.5f,1.5f);
    view.layer.masksToBounds = NO;
    view.layer.shadowRadius = 1.0f;
}
+ (void) setStyleNavigationBar:(UINavigationBar *)navigationBar withTitle:(NSString *)title{
    navigationBar.translucent = NO;
    NSRange rangeText= NSMakeRange(0, title.length);
    navigationBar.barTintColor = [UIColor whiteColor];
    NSMutableAttributedString *attString =[[NSMutableAttributedString alloc] initWithString:title];
    [attString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Santana" size:20] range:rangeText];
    [attString addAttribute:NSForegroundColorAttributeName value:[StylesBaronha getPrimaryColor] range:rangeText];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(81, 11, 300, 44)];
    label.attributedText = attString;
    [label sizeToFit];
    NSArray*items = navigationBar.items;
    [[items objectAtIndex:0] setTitleView:label];
}

@end
