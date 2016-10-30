//
//  HomeBorneiroViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HomeBorneiroViewController.h"
#import "UIViewController+MMDrawerController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "StyleBorneiro.h"
#import "Constants.h"
#import "ConstantsURL.h"

@interface HomeBorneiroViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imagenBackground;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (weak, nonatomic) IBOutlet UIView *viewComoLlegar;
@property (weak, nonatomic) IBOutlet UILabel *labelComoLlegar;
@property (weak, nonatomic) IBOutlet UIView *viewCiudad;
@property (weak, nonatomic) IBOutlet UILabel *labelCiudad;
@property (weak, nonatomic) IBOutlet UIView *ViewVisita;
@property (weak, nonatomic) IBOutlet UILabel *labelVisita;
@property (weak, nonatomic) IBOutlet UIView *viewCultura;
@property (weak, nonatomic) IBOutlet UILabel *labelCultura;
@property (weak, nonatomic) IBOutlet UIView *viewSitiosInteres;
@property (weak, nonatomic) IBOutlet UILabel *labelSitios;


@end

@implementation HomeBorneiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - load data
-(void)loadData{
    [_imagenBackground setContentMode:UIViewContentModeScaleAspectFill];
    [_imagenBackground setImage:[UIImage imageNamed:@"fondo"]];
    _labelComoLlegar.text = NSLocalizedString(@"btn_home_comollegar", nil);
    _labelCiudad.text = NSLocalizedString(@"btn_home_ciudad", nil);
    _labelVisita.text = NSLocalizedString(@"btn_home_visita", nil);
    _labelCultura.text = NSLocalizedString(@"btn_home_cultura", nil);
    _labelSitios.text = NSLocalizedString(@"btn_home_sitios", nil);
    
   
}
-(void)loadStyle{
    self.labelComoLlegar.adjustsFontSizeToFitWidth = YES;
    [StyleBorneiro setStyleSubtitleMoreInfo:_labelComoLlegar];
    self.labelComoLlegar.textColor = [UIColor whiteColor];
    self.labelCiudad.adjustsFontSizeToFitWidth = YES;
    [StyleBorneiro setStyleSubtitleMoreInfo:_labelCiudad];
    self.labelCiudad.textColor = [UIColor whiteColor];
    self.labelSitios.adjustsFontSizeToFitWidth = YES;
    [StyleBorneiro setStyleSubtitleMoreInfo:_labelSitios];
    self.labelSitios.textColor = [UIColor whiteColor];
    self.labelVisita.adjustsFontSizeToFitWidth = YES;
    [StyleBorneiro setStyleSubtitleMoreInfo:_labelVisita];
    self.labelVisita.textColor = [UIColor whiteColor];
    self.labelCultura.adjustsFontSizeToFitWidth = YES;
    [StyleBorneiro setStyleSubtitleMoreInfo:_labelCultura];
    self.labelCultura.textColor = [UIColor whiteColor];
    
    
    UITapGestureRecognizer * gestureComollegar =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapComoLlegar:)];
    gestureComollegar.numberOfTapsRequired = 1;
    [self.viewComoLlegar addGestureRecognizer:gestureComollegar];
    UITapGestureRecognizer * gestureCiudad =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapCiudad:)];
    gestureCiudad.numberOfTapsRequired = 1;
    [self.viewCiudad addGestureRecognizer:gestureCiudad];
    UITapGestureRecognizer * gestureVisita =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapComenzar:)];
    gestureVisita.numberOfTapsRequired = 1;
    [self.ViewVisita addGestureRecognizer:gestureVisita];
    UITapGestureRecognizer * gestureCultura =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapCultura:)];
    gestureCultura.numberOfTapsRequired = 1;
    [self.viewCultura addGestureRecognizer:gestureVisita];
    UITapGestureRecognizer * gestureSitios =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapSitios:)];
    gestureSitios.numberOfTapsRequired = 1;
    [self.viewSitiosInteres addGestureRecognizer:gestureSitios];
 
}
#pragma mark - Me

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnMenuTouch {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
- (void)tapComoLlegar:(UITapGestureRecognizer *)tap{
     [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemComoLlegar)];
}
- (void)tapCiudad:(UITapGestureRecognizer *)tap{
     [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemCidaBorneiro)];
}
- (void)tapComenzar:(UITapGestureRecognizer *)tap{
     [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemGuia)];
    
}
- (void)tapCultura:(UITapGestureRecognizer *)tap{
         [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemCulturaCastrenha)];
    
}
- (void)tapSitios:(UITapGestureRecognizer *)tap{
         [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemPoi)];
    
}
@end
