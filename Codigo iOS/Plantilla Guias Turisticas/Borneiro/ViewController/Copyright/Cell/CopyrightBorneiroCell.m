//
//  CopyrightCell.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightBorneiroCell.h"
#import "Metodos.h"

@interface CopyrightBorneiroCell()
@property (weak, nonatomic) IBOutlet UILabel *labelText;

@end

@implementation CopyrightBorneiroCell

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
    
    
}

@end
