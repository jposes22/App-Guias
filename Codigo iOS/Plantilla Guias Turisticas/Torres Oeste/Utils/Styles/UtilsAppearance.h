//
//  UtilsAppearance.h
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UtilsAppearance : NSObject
+ (UIColor * )getPrimaryColor;
+ (UIColor * )getPrimaryDarkColor;
+ (UIColor * )getSecondaryColor;

//Style Fonts and FontSize

+ (void)setStyleTitle:(UILabel *) label;
+ (void)setSytleSubtitle:(UILabel *) label;
+ (void)setStyleText:(UILabel *) label;
+ (void)setStyleTextBold:(UILabel *) label;
+ (void)setStyleButtonText:(UIButton *) button;
+ (void)setStyleTitleList:(UILabel *) label;
+ (void)setSytleSubtitleList:(UILabel *) label;
+ (void)setStyleSubtitleMoreInfo:(UILabel *) label;

+(void)setCircleView:(UIView *) view;
+ (void) setStyleNavigationBar:(UINavigationBar *)navigationBar withTitle:(NSString *)title;
+ (void) setStyleNavigationBarSaberMas:(UINavigationBar *)navigationBar withTitle:(NSString *)title;
@end
