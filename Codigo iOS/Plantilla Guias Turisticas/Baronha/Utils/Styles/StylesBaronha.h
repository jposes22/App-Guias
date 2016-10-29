//
//  StylesBaronha.h
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StylesBaronha : NSObject

+ (UIColor * )getPrimaryColor;
+ (UIColor * )getPrimaryLightColor;
+ (UIColor * )getSecondaryColor;

//Style Fonts and FontSize

+ (void)setStyleTitle:(UILabel *) label;
+ (void)setStyleTitleWhite:(UILabel *) label;
+ (void)setSytleSubtitle:(UILabel *) label;
+ (void)setStyleText:(UILabel *) label;
+ (void)setStyleTextBold:(UILabel *) label;
+ (void)setStyleButtonText:(UIButton *) button;
+ (void)setStyleTitleList:(UILabel *) label;
+ (void)setSytleSubtitleList:(UILabel *) label;
+ (void)setStyleSubtitleMoreInfo:(UILabel *) label;

+(void)setCircleView:(UIView *) view;
+ (void) setStyleNavigationBar:(UINavigationBar *)navigationBar withTitle:(NSString *)title;
@end
