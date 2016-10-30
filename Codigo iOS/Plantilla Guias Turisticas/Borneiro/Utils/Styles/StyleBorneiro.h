//
//  StyleBorneiro.h
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StyleBorneiro : NSObject
+ (UIColor * )getPrimaryColor;
+ (UIColor * )getPrimaryDarkColor;


+ (UIColor *) getVerdeClaroComoLlegar;
+ (UIColor *) getVerdeOscuroComoLlegar;

+ (UIColor *) getVerdeClaroVisita;
+ (UIColor *) getVerdeOscuroVisita;

+ (UIColor *) getVerdeClaroCida;
+ (UIColor *) getVerdeOscuroCida;
+ (UIColor *) getVerdeClaroCultura;
+ (UIColor *) getVerdeOscuroCultura;

+ (UIColor *) getColorText;

//Style Fonts and FontSize

+ (void)setStyleTitle:(UILabel *) label;
+ (void)setSytleSubtitle:(UILabel *) label;
+ (void)setStyleText:(UILabel *) label;
+ (void)setStyleTextBold:(UILabel *) label;
+ (void)setStyleButtonText:(UIButton *) button;
+ (void)setStyleTitleList:(UILabel *) label;
+ (void)setSytleSubtitleList:(UILabel *) label;
+ (void)setStyleSubtitleMoreInfo:(UILabel *) label;

+ (void)setStyleTitleComoLlegar:(UILabel *) label;
+ (void)setStyleTitleVisita:(UILabel *) label;
+ (void)setStyleTitleCida:(UILabel *) label;
+ (void)setStyleTitleCultura:(UILabel *) label;
+ (void)setStyleSubTitleVisita:(UILabel *) label;
+ (void)setStyleSubTitleCida:(UILabel *) label;
+ (void)setStyleSubTitleCultura:(UILabel *) label;


+(void)setCircleView:(UIView *) view;
+ (void) setStyleNavigationBar:(UINavigationBar *)navigationBar withTitle:(NSString *)title backgroundColor:(UIColor *)background;

@end
