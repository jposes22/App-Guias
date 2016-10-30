//
//  StyleBorneiro.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "StyleBorneiro.h"

@implementation StyleBorneiro

+(UIColor * )getVerdeClaroComoLlegar{
    return [UIColor colorWithRed:194.0/255.0 green:221.0/255.0 blue:189.0/255.0 alpha:1.0];
}
+(UIColor * )getVerdeOscuroComoLlegar{
    return [UIColor colorWithRed:161.0/255.0 green:182.0/255.0 blue:156.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeClaroVisita{
    return [UIColor colorWithRed:217.0/255.0 green:225.0/255.0 blue:164.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeOscuroVisita{
    return [UIColor colorWithRed:181.0/255.0 green:186.0/255.0 blue:138.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeClaroCida{
    return [UIColor colorWithRed:217.0/255.0 green:231.0/255.0 blue:188.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeOscuroCida{
    return [UIColor colorWithRed:181.0/255.0 green:192.0/255.0 blue:157.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeClaroCultura{
    return [UIColor colorWithRed:215.0/255.0 green:244.0/255.0 blue:188.0/215.0 alpha:1.0];
}
+ (UIColor *) getVerdeOscuroCultura{
    return [UIColor colorWithRed:176.0/255.0 green:191.0/255.0 blue:174.0/255.0 alpha:1.0];
}
+ (UIColor *) getVerdeClaroPoi{
    return [UIColor colorWithRed:203.0/255.0 green:219.0/255.0 blue:189.0/215.0 alpha:1.0];
}
+ (UIColor *) getVerdeOscuroPoi{
    return [UIColor colorWithRed:171.0/255.0 green:183.0/255.0 blue:157.0/255.0 alpha:1.0];
}
+(UIColor * )getPrimaryColor{
    return [UIColor colorWithRed:216.0/255.0 green:225.0/255.0 blue:170.0/255.0 alpha:1.0];

}

+(UIColor * )getPrimaryDarkColor{
    return [UIColor colorWithRed:176.0/255.0 green:191.0/255.0 blue:174.0/255.0 alpha:1.0];

}


+(UIColor * )getColorText{
    return [UIColor colorWithRed:91.0/255.0 green:91.0/255.0 blue:91.0/255.0 alpha:1.0];
}



+(void)setStyleTitle:(UILabel *)label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:30]];
    label.textColor = [StyleBorneiro getPrimaryDarkColor];
    
}

+ (void)setStyleTitleComoLlegar:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:30]];
    label.textColor = [StyleBorneiro getVerdeClaroComoLlegar];
}
+ (void)setStyleTitleVisita:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:25]];
    label.textColor = [StyleBorneiro getVerdeOscuroVisita];
}
+ (void)setStyleSubTitleVisita:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:15]];
    label.textColor = [StyleBorneiro getVerdeOscuroVisita];
}
+ (void)setStyleTitleCida:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:25]];
    label.textColor = [StyleBorneiro getVerdeOscuroCida];
}
+ (void)setStyleSubTitleCida:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:15]];
    label.textColor = [StyleBorneiro getVerdeOscuroCida];
}
+ (void)setStyleTitleCultura:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:25]];
    label.textColor = [StyleBorneiro getVerdeOscuroCultura];
}
+ (void)setStyleSubTitleCultura:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:15]];
    label.textColor = [StyleBorneiro getVerdeOscuroCultura];
}
+ (void)setStyleSubTitlePoi:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:15]];
    label.textColor = [StyleBorneiro getVerdeOscuroPoi];
}

+ (void)setSytleSubtitle:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:20]];
    
}
+ (void)setStyleText:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:15]];
    label.textColor = [StyleBorneiro getColorText];
}


+ (void)setStyleTextBold:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Bold" size:12]];
    
    
}
+ (void)setStyleButtonText:(UIButton *) button{
    [button.titleLabel setFont:[UIFont fontWithName:@"Giorgio" size:15]];
}
+ (void)setStyleTitleList:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:20]];
    label.textColor = [StyleBorneiro getPrimaryColor];
    
}
+ (void)setSytleSubtitleList:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"OpenSans-Light" size:15]];
    
    
}
+ (void)setStyleSubtitleMoreInfo:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Giorgio" size:12]];
    
    
}

+(void)setCircleView:(UIView *) view{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 1.0;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(1.5f,1.5f);
    view.layer.masksToBounds = NO;
    view.layer.shadowRadius = 1.0f;
}
+ (void) setStyleNavigationBar:(UINavigationBar *)navigationBar withTitle:(NSString *)title backgroundColor:(UIColor *)background{
    navigationBar.translucent = NO;
    NSRange rangeText= NSMakeRange(0, title.length);
    navigationBar.barTintColor = background;
    NSMutableAttributedString *attString =[[NSMutableAttributedString alloc] initWithString:title];
    [attString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Giorgio" size:20] range:rangeText];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:rangeText];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(81, 11, 300, 44)];
    label.attributedText = attString;
    [label sizeToFit];
    NSArray*items = navigationBar.items;
    [[items objectAtIndex:0] setTitleView:label];
}

@end
