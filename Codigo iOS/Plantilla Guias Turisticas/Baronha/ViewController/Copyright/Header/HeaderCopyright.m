//
//  HeaderCopyright.m
//  TorresDeOeste
//
//  Created by Evelb on 28/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderCopyright.h"
#import "UtilsAppearance.h"
@interface HeaderCopyright()
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;

@end

@implementation HeaderCopyright

- (void) loadData:(NSString *)titulo{
    _labelTitulo.text = NSLocalizedString(@"copyright_titulo", nil);
    [UtilsAppearance setStyleTitle:_labelTitulo];
    _labelTitulo.textColor = [UtilsAppearance getSecondaryColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
