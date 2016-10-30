//
//  HeaderCopyright.m
//  TorresDeOeste
//
//  Created by Evelb on 28/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HeaderBorneiroCopyright.h"
#import "StyleBorneiro.h"
@interface HeaderBorneiroCopyright()
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;

@end

@implementation HeaderBorneiroCopyright

- (void) loadData:(NSString *)titulo{
    _labelTitulo.text = titulo;
    [StyleBorneiro setStyleTitle:_labelTitulo];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
