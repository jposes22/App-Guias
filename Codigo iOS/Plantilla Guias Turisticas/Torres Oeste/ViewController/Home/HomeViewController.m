//
//  HomeViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+MMDrawerController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UtilsAppearance.h"
#import "Constants.h"


@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *btnComoLlegar;
@property (weak, nonatomic) IBOutlet UIButton *btnTorresOeste;
@property (weak, nonatomic) IBOutlet UIButton *btnRomeria;
@property (weak, nonatomic) IBOutlet UIButton *btnLugaresInteres;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
    NSString *aux = NSLocalizedString(@"aux", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
//TODO: Cambiar ruta imagene background 
#pragma mark - load data
-(void)loadData{
    [_backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    NSArray * listOfImage =[[NSArray alloc] initWithObjects:[UIImage imageNamed:@"slide_image1"],[UIImage imageNamed:@"slide_image2"],[UIImage imageNamed:@"slide_image3"],[UIImage imageNamed:@"slide_image4"], nil];
    [_backgroundImage setAnimationImages:listOfImage];
    _backgroundImage.animationDuration = 15.0f;
    _backgroundImage.animationRepeatCount = 0;
    [_backgroundImage startAnimating];
    [self.btnRomeria setTitle:@"Romeria" forState:UIControlStateNormal];
    [self.btnComoLlegar setTitle:@"Cómo llegar" forState:UIControlStateNormal];
    [self.btnTorresOeste setTitle:@"Torres de Oeste" forState:UIControlStateNormal];
    [self.btnLugaresInteres setTitle:@"Lugares de interés" forState:UIControlStateNormal];
}
-(void)loadStyle{
    [UtilsAppearance setStyleButtonText:_btnRomeria];
    [UtilsAppearance setStyleButtonText:_btnComoLlegar];
    [UtilsAppearance setStyleButtonText:_btnTorresOeste];
    [UtilsAppearance setStyleButtonText:_btnLugaresInteres];
    self.btnRomeria.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.btnTorresOeste.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.btnComoLlegar.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.btnLugaresInteres.titleLabel.adjustsFontSizeToFitWidth = YES;



    
}
#pragma mark - Menu
- (IBAction)openMenu:(id)sender {
        [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
- (IBAction)btnComoLlegarTouch {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemComoLlegar)];
}
- (IBAction)btnTorresOestoTouch {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemTorres)];
}
- (IBAction)btnRomariaTouch {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemRomeria)];
}
- (IBAction)btnLugarInteresTouch {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemPoi)];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
