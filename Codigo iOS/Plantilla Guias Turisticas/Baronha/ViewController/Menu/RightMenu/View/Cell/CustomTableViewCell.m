//
//  CustomTableViewCell.m
//  plantilla
//
//  Created by José Pose Salgueiro on 12/2/16.
//  Copyright © 2016 pruebas. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UtilsAppearance.h"



@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self loadAppearance];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) loadAppearance{
   // [UtilsAppearance setStyleCellBasic:_labelTitle];
    //  self.backgroundColor =  [UtilsAppearance  getColorDarkApp];
    self.backgroundColor = [UtilsAppearance getPrimaryLightColor];
    
    _labelTitle.textColor = [UIColor whiteColor];

}

@end
