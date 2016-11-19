//
//  CopyrightCell.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightCell.h"
#import "Metodos.h"
#import "UtilsAppearance.h"

@interface CopyrightCell()
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@end

@implementation CopyrightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) loadData:(NSString *)nombre texto:(NSString *)texto{
    _labelText.attributedText = [Metodos convertHTMLToString:texto];
    //[UtilsAppearance setStyleText:_labelText];
    
    
}

@end
