//
//  PoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiViewControllerBaronha.h"

#import "ConstantsURL.h"
#import "Constants.h"
#import "UIViewController+MMDrawerController.h"
#import "ListPoiViewController.h"
#import "NavigationBar.h"
#import "UtilsAppearance.h"
#import "DetailPoiViewControllerBaronha.h"

@interface PoiViewControllerBaronha ()<CommnicationMenu>
@property (weak, nonatomic) IBOutlet UIView *viewPetroglifos;
@property (weak, nonatomic) IBOutlet UIView *viewCastroQueiruga;
@property (weak, nonatomic) IBOutlet UIView *viewPraiaCoido;
@property (weak, nonatomic) IBOutlet UIView *viewPraiaArealonga;

@property (weak, nonatomic) IBOutlet UILabel *labelPetroglifos;
@property (weak, nonatomic) IBOutlet UILabel *labelCastroQueiruga;
@property (weak, nonatomic) IBOutlet UILabel *labelPraiaCoido;
@property (weak, nonatomic) IBOutlet UILabel *labelPraiaArealonga;

@end

@implementation PoiViewControllerBaronha

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadStyle];
    [self loadData];
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
-(void) loadData{
    

}

-(void)loadStyle{/*
    [_viewRecursos setBackgroundColor:[UtilsAppearance getSecondaryColor]];
    [_viewAlojamiento setBackgroundColor:[UtilsAppearance getSecondaryColor]];
    [_viewRestaurantes setBackgroundColor:[UtilsAppearance getSecondaryColor]];
    [_viewTelefonosInteres setBackgroundColor:[UtilsAppearance getSecondaryColor]];
    
    [UtilsAppearance setStyleTextBold:_labelRecursos];
    [UtilsAppearance setStyleTextBold:_labelDirectorio];
    [UtilsAppearance setStyleTextBold:_labelAlojamiento];
    [UtilsAppearance setStyleTextBold:_labelRestauracion];
    _labelRecursos.textColor = [UIColor whiteColor];
    _labelDirectorio.textColor = [UIColor whiteColor];
    _labelAlojamiento.textColor = [UIColor whiteColor];
    _labelRestauracion.textColor = [UIColor whiteColor];

*/


    
}

-(void) loadGestures{
    
 
    UITapGestureRecognizer *tapRecursos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPetroglifos)];
    [self.viewPetroglifos addGestureRecognizer:tapRecursos];
    UITapGestureRecognizer *tapAlojamientos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openQueiroga)];
    [self.viewCastroQueiruga addGestureRecognizer:tapAlojamientos];
    UITapGestureRecognizer *tapRestaurantes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPraiaCoido)];
    [self.viewPraiaCoido addGestureRecognizer:tapRestaurantes];
    UITapGestureRecognizer *tapTelefonosInteres = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPraiaArealonga)];
    [self.viewPraiaArealonga addGestureRecognizer:tapTelefonosInteres];
}


-(void)openPetroglifos{
    [self performSegueWithIdentifier:kSEGUE_POI sender:@(kTipoPoiPetroglifos)];
}
-(void)openQueiroga{
    [self performSegueWithIdentifier:kSEGUE_POI sender:@(kTipoPoiCastroQueiruga)];
}
-(void)openPraiaCoido{
    [self performSegueWithIdentifier:kSEGUE_POI sender:@(kTipoPoiPraiaCoido)];
}
-(void)openPraiaArealonga{
    [self performSegueWithIdentifier:kSEGUE_POI sender:@(kTipoPoiArealonga)];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

        // Make sure your segue name in storyboard is the same as this line
        if ([[segue identifier] isEqualToString:kSEGUE_POI])
        {
            // Get reference to the destination view controller
            DetailPoiViewControllerBaronha *vc = [segue destinationViewController];
            
            // Pass any objects to the view controller here, like...
            [vc setCategoryPoi:[sender integerValue]];
        }
}


@end
