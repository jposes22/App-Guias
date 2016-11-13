//
//  UtilsAppearance.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "UtilsAppearance.h"
#import "StylesBaronha.h"

@implementation UtilsAppearance
+(UIColor * )getPrimaryColor{
    return [UIColor colorWithRed:51.0/255.0 green:157.0/255.0 blue:182.0/255.0 alpha:1.0];
}
+(UIColor * )getPrimaryLightColor{
    return [UIColor colorWithRed:25.0/255.0 green:187.0/255.0 blue:216.0/255.0 alpha:1.0];
}
+(UIColor * )getSecondaryColor{
    return [StylesBaronha getPrimaryLightColor];
}

+(UIColor * )getThirdColor{
    return [UIColor colorWithRed:91.0/255.0 green:91.0/255.0 blue:95.0/255.0 alpha:1.0];
}


+ (void)setStyleTitle:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Santana" size:30]];
    label.textColor = [UtilsAppearance getPrimaryColor];
    
}
+ (void)setSytleSubtitle:(UILabel *) label{
    [label setFont:[UIFont fontWithName:@"Santana" size:20]];

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
    label.textColor = [UtilsAppearance getPrimaryColor];

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
    //navigationBar.barTintColor = [UIColor whiteColor];
    NSMutableAttributedString *attString =[[NSMutableAttributedString alloc] initWithString:title];
    [attString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans-Light" size:20] range:rangeText];
    [attString addAttribute:NSForegroundColorAttributeName value:[UtilsAppearance getPrimaryColor] range:rangeText];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(81, 11, 300, 44)];
    label.attributedText = attString;
    [label sizeToFit];
    NSArray*items = navigationBar.items;
    [[items objectAtIndex:0] setTitleView:label];
}
+ (void) setStyleNavigationBarSaberMas:(UINavigationBar *)navigationBar withTitle:(NSString *)title{
    navigationBar.translucent = NO;
    [navigationBar setBarTintColor:[UtilsAppearance getPrimaryColor]];
    NSRange rangeText= NSMakeRange(0, title.length);
    NSMutableAttributedString *attString =[[NSMutableAttributedString alloc] initWithString:title];
    [attString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans-Light" size:20] range:rangeText];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:rangeText];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(81, 11, 300, 44)];
    label.attributedText = attString;
    [label sizeToFit];
    NSArray*items = navigationBar.items;
    [[items objectAtIndex:0] setTitleView:label];
}


@end
