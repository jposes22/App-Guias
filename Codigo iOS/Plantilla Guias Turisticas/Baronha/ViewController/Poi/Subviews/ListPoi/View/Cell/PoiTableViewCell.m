//
//  PoiTableViewCell.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiTableViewCell.h"

#import "Constants.h"
#import "OpenExternalApps.h"
#import "Validator.h"
#import "UtilsAppearance.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PoiTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UIImageView *imgViewPhone;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewEmail;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewWeb;
@property (weak, nonatomic) IBOutlet UIImageView *imgPosition;

@property (nonatomic,strong) Poi *poi;
@end

@implementation PoiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     [self loadStyle];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       
        
    }
    return self;
}

-(void) loadData:(Poi*)poi{
    _poi = poi;
    _lblTitle.text = poi.titulo;
    _lblDescription.text = poi.descripcion;
    if(poi.urlImagen){
        [_imgView sd_setImageWithURL:[[NSURL alloc] initWithString:poi.urlImagen] placeholderImage:[UIImage imageNamed:@"" ]];
    }else{
        _imgView.image = [UIImage imageNamed:@""];
    }
    //validate buttons
    if([Validator validatePhone:poi.telefono]){
        _imgViewPhone.image = [UIImage imageNamed:@"bt_telefono_on"];
        UITapGestureRecognizer *tapViewPhone = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPhoneCall) ];
        [self.imgViewPhone addGestureRecognizer:tapViewPhone];
    }else{
         _imgViewPhone.image = [UIImage imageNamed:@"bt_telefono_off"];
    }
    
    if([Validator validateEmail:poi.email]){
        _imgViewEmail.image = [UIImage imageNamed:@"bt_mail_on"];
        UITapGestureRecognizer *tapViewEmail = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openSendEmail)];
        [self.imgViewEmail addGestureRecognizer:tapViewEmail];
    }else{
         _imgViewEmail.image = [UIImage imageNamed:@"bt_mail_off"];
    }
    
    if([Validator validateWeb:poi.urlWeb]){
        _imgViewWeb.image = [UIImage imageNamed:@"bt_web_on"];
        UITapGestureRecognizer *tapViewWeb = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openUrlWeb)];
        [self.imgViewWeb addGestureRecognizer:tapViewWeb];
    }else{
        _imgViewWeb.image = [UIImage imageNamed:@"bt_web_off"];
    }
    
    if([Validator validatePositionGPS:poi.latitud andLongitud:poi.longitud]){
        _imgPosition.image = [UIImage imageNamed:@"bt_localizacion_on"];
        UITapGestureRecognizer *tapPosition = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openGPS)];
        [self.imgPosition addGestureRecognizer:tapPosition];
    }else{
        _imgPosition.image = [UIImage imageNamed:@"bt_localizacion_off"];
    }

}

-(void) openPhoneCall{
    [OpenExternalApps openPhoneCall:_poi.telefono];
}
-(void) openSendEmail{
    [OpenExternalApps openSendEmail:_poi.email];
}
-(void) openUrlWeb{
    [OpenExternalApps openUrlWeb:_poi.urlWeb];
}
-(void) openGPS{
   [OpenExternalApps openGPSWithLatitud:_poi.latitud andLongitud:_poi.longitud];
}

-(void) loadStyle{
    [UtilsAppearance setStyleTitleList:_lblTitle];
    [UtilsAppearance setSytleSubtitleList:_lblDescription];
}

@end
