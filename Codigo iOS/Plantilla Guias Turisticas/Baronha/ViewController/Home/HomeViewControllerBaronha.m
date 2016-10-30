//
//  HomeViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "HomeViewControllerBaronha.h"
#import "UIViewController+MMDrawerController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "StylesBaronha.h"
#import "Constants.h"
#import "ConstantsURL.h"

@interface HomeViewControllerBaronha ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewMenu;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *btnComoLlegar;
@property (weak, nonatomic) IBOutlet UIButton *btnTorresOeste;
@property (weak, nonatomic) IBOutlet UIButton *btnLugaresInteres;


@end

@implementation HomeViewControllerBaronha

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
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

    _lblTitle.text = NSLocalizedString(@"title_logo", nil);
    _lblSubTitle.text = NSLocalizedString(@"sub_title_logo", nil);
    [self.btnComoLlegar setTitle:NSLocalizedString(@"btn_como_llegar",nil) forState:UIControlStateNormal];
    [self.btnTorresOeste setTitle:NSLocalizedString(@"btn_como_castro",nil) forState:UIControlStateNormal];
    [self.btnLugaresInteres setTitle:NSLocalizedString(@"btn_como_lugares",nil) forState:UIControlStateNormal];
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(openMenu:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [_imageViewMenu addGestureRecognizer:tapGestureRecognizer];
}
-(void)loadStyle{
    [StylesBaronha setStyleTitleWhite:_lblTitle];
    [StylesBaronha setSytleSubtitle:_lblSubTitle];
    [StylesBaronha setStyleButtonText:_btnComoLlegar];
    [StylesBaronha setStyleButtonText:_btnTorresOeste];
    [StylesBaronha setStyleButtonText:_btnLugaresInteres];
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
    [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_GO_TO object:@(SideDrawerMenuItemGuia)];
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
