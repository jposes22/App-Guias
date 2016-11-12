//
//  PoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiViewController.h"

#import "ConstantsURL.h"
#import "Constants.h"
#import "UIViewController+MMDrawerController.h"
#import "ListPoiViewController.h"
#import "DetailPoiViewController.h"
#import "NavigationBar.h"
#import "UtilsAppearance.h"

@interface PoiViewController ()<CommnicationMenu>
@property (weak, nonatomic) IBOutlet NavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UIView *viewPetroglifos;
@property (weak, nonatomic) IBOutlet UIView *viewMolinos;
@property (weak, nonatomic) IBOutlet UIView *viewRutas;
@property (weak, nonatomic) IBOutlet UIView *viewLaguna;

@property (weak, nonatomic) IBOutlet UIView *viewAlojamiento;
@property (weak, nonatomic) IBOutlet UIView *viewRestaurantes;
@property (weak, nonatomic) IBOutlet UIView *viewTelefonosInteres;

@property (weak, nonatomic) IBOutlet UILabel *labelPetroglifos;
@property (weak, nonatomic) IBOutlet UILabel *labelMolinos;
@property (weak, nonatomic) IBOutlet UILabel *labelRutas;
@property (weak, nonatomic) IBOutlet UILabel *labelLaguna;

@property (weak, nonatomic) IBOutlet UILabel *labelAlojamiento;
@property (weak, nonatomic) IBOutlet UILabel *labelRestauracion;
@property (weak, nonatomic) IBOutlet UILabel *labelTelefonosInteres;

@end

@implementation PoiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadStyle];
    [self loadGestures];
    [self loadNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];


}

-(void)loadNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_lugares", nil)];
}
- (IBAction)btnOpenMenu:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}


-(void)loadStyle{
    [_viewPetroglifos setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewMolinos setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewRutas setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewLaguna setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    
    [_viewAlojamiento setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewRestaurantes setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewTelefonosInteres setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    
    [UtilsAppearance setStyleTextBold:_labelPetroglifos];
    [UtilsAppearance setStyleTextBold:_labelMolinos];
    [UtilsAppearance setStyleTextBold:_labelRutas];
    [UtilsAppearance setStyleTextBold:_labelLaguna];
    
    [UtilsAppearance setStyleTextBold:_labelAlojamiento];
    [UtilsAppearance setStyleTextBold:_labelRestauracion];
    [UtilsAppearance setStyleTextBold:_labelTelefonosInteres];
    
    
    _labelPetroglifos.textColor = [UIColor whiteColor];
    _labelMolinos.textColor = [UIColor whiteColor];
    _labelRutas.textColor = [UIColor whiteColor];
    _labelLaguna.textColor = [UIColor whiteColor];

    _labelAlojamiento.textColor = [UIColor whiteColor];
    _labelRestauracion.textColor = [UIColor whiteColor];
    _labelTelefonosInteres.textColor = [UIColor whiteColor];

    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _labelPetroglifos.text = NSLocalizedString(@"pois_petroglifo", nil);
    _labelMolinos.text = NSLocalizedString(@"pois_molinos", nil);
    _labelRutas.text = NSLocalizedString(@"pois_rutas", nil);
    _labelLaguna.text = NSLocalizedString(@"pois_laguna", nil);
    
    _labelAlojamiento.text = NSLocalizedString(@"pois_alojamiento", nil);
    _labelRestauracion.text = NSLocalizedString(@"pois_restaurante", nil);
    _labelTelefonosInteres.text = NSLocalizedString(@"pois_telefonos", nil);
    
}

-(void) loadGestures{
    UITapGestureRecognizer *tapPetroglifos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPetroglifos)];
    [self.viewPetroglifos addGestureRecognizer:tapPetroglifos];
    
    
    UITapGestureRecognizer *tapMolinos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openMolinos)];
    [self.viewMolinos addGestureRecognizer:tapMolinos];
    
    
    UITapGestureRecognizer *tapRutas = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRutas)];
    [self.viewRutas addGestureRecognizer:tapRutas];
    
    
    UITapGestureRecognizer *tapLagunas = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openLaguna)];
    [self.viewLaguna addGestureRecognizer:tapLagunas];
    
    
    UITapGestureRecognizer *tapAlojamiento = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAlojamiento)];
    [self.viewAlojamiento addGestureRecognizer:tapAlojamiento];
    
    
    UITapGestureRecognizer *tapRestaurante = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRestaurante)];
    [self.viewRestaurantes addGestureRecognizer:tapRestaurante];
    
    
    
    UITapGestureRecognizer *tapTelefonos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openTelefonosInteres)];
    [self.viewTelefonosInteres addGestureRecognizer:tapTelefonos];
   
}


-(void)openPetroglifos{
    [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:@(kTipoPoiPetroglifos)];
}
-(void)openMolinos{
    [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:@(kTipoMolinos)];
}
-(void)openRutas{
    [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:@(kTipoRutas)];
}
-(void)openLaguna{
    [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:@(kTipoLaguna)];
}

-(void)openAlojamiento{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoALojamiento)];
}
-(void)openRestaurante{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoRestaurante)];
}
-(void)openTelefonosInteres{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTIpoTelefonos)];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

        // Make sure your segue name in storyboard is the same as this line
        if ([[segue identifier] isEqualToString:kSEGUE_LIST_POI])
        {
            // Get reference to the destination view controller
            ListPoiViewController *vc = [segue destinationViewController];
            
            // Pass any objects to the view controller here, like...
            [vc setCategoryPoi:[sender integerValue]];
        }else if([[segue identifier] isEqualToString:kSEGUE_SHOW_DETAIL])
        {
            // Get reference to the destination view controller
            DetailPoiViewController *vc = [segue destinationViewController];
            
            // Pass any objects to the view controller here, like...
            [vc setCategoryPoi:[sender integerValue]];
        }
}


@end
