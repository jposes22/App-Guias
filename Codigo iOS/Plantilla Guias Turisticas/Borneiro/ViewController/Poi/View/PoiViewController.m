//
//  PoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiViewController.h"

#import "Constants.h"
#import "ConstantsURL.h"
#import "UIViewController+MMDrawerController.h"
#import "ListPoiViewController.h"
#import "NavigationBar.h"
#import "UtilsAppearance.h"

@interface PoiViewController ()<CommnicationMenu>
@property (weak, nonatomic) IBOutlet NavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIView *viewRecursos;
@property (weak, nonatomic) IBOutlet UIView *viewAlojamiento;
@property (weak, nonatomic) IBOutlet UIView *viewRestaurantes;
@property (weak, nonatomic) IBOutlet UIView *viewTelefonosInteres;
@property (weak, nonatomic) IBOutlet UILabel *labelRecursos;
@property (weak, nonatomic) IBOutlet UILabel *labelAlojamiento;
@property (weak, nonatomic) IBOutlet UILabel *labelRestauracion;
@property (weak, nonatomic) IBOutlet UILabel *labelDirectorio;

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
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Lugares de Interés"];
}
- (IBAction)btnOpenMenu:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}


-(void)loadStyle{
    [_viewRecursos setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewAlojamiento setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewRestaurantes setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [_viewTelefonosInteres setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    
    [UtilsAppearance setStyleTextBold:_labelRecursos];
    [UtilsAppearance setStyleTextBold:_labelDirectorio];
    [UtilsAppearance setStyleTextBold:_labelAlojamiento];
    [UtilsAppearance setStyleTextBold:_labelRestauracion];
    _labelRecursos.textColor = [UIColor whiteColor];
    _labelDirectorio.textColor = [UIColor whiteColor];
    _labelAlojamiento.textColor = [UIColor whiteColor];
    _labelRestauracion.textColor = [UIColor whiteColor];




    
}

-(void) loadGestures{
    UITapGestureRecognizer *tapRecursos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRecursos)];
    [self.viewRecursos addGestureRecognizer:tapRecursos];
    UITapGestureRecognizer *tapAlojamientos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAlojamientos)];
    [self.viewAlojamiento addGestureRecognizer:tapAlojamientos];
    UITapGestureRecognizer *tapRestaurantes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRestaurantes)];
    [self.viewRestaurantes addGestureRecognizer:tapRestaurantes];
    UITapGestureRecognizer *tapTelefonosInteres = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openTelefonosInteres)];
    [self.viewTelefonosInteres addGestureRecognizer:tapTelefonosInteres];
}


-(void)openRecursos{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoPoiRecursosPatrimoniales)];
}
-(void)openAlojamientos{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoPoiAlojamientos)];
}
-(void)openRestaurantes{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoPoiRestauracion)];
}
-(void)openTelefonosInteres{
    [self performSegueWithIdentifier:kSEGUE_LIST_POI sender:@(kTipoPoiDirectorio)];
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
        }
}


@end
