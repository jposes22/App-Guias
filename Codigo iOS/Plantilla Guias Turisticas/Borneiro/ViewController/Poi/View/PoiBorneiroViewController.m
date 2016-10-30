//
//  PoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "PoiBorneiroViewController.h"

#import "Constants.h"
#import "ConstantsURL.h"
#import "UIViewController+MMDrawerController.h"
#import "ListPoiBorneiroViewController.h"
#import "NavigationBar.h"
#import "DetailPoiBorneiroViewController.h"
#import "StyleBorneiro.h"

@interface PoiBorneiroViewController ()<CommnicationMenu>

@property (weak, nonatomic) IBOutlet UIView *viewRecursosArqueologico;
@property (weak, nonatomic) IBOutlet UIView *viewRecursosHistorico;
@property (weak, nonatomic) IBOutlet UIView *viewRutasSenderismo;
@property (weak, nonatomic) IBOutlet UIView *viewPlayas;
@property (weak, nonatomic) IBOutlet UIView *viewDirectorio;
@property (weak, nonatomic) IBOutlet UIView *viewHosteleria;
@property (weak, nonatomic) IBOutlet UILabel *labelRecursosArqueologicos;
@property (weak, nonatomic) IBOutlet UILabel *labelRecursosHistoricos;
@property (weak, nonatomic) IBOutlet UILabel *labelRutasSenderismo;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayas;
@property (weak, nonatomic) IBOutlet UILabel *labelDirectorio;
@property (weak, nonatomic) IBOutlet UILabel *labelHosteleria;

@end

@implementation PoiBorneiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
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
    [StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"menu_sitios_interes", nil) backgroundColor:[StyleBorneiro getVerdeOscuroPoi]];
}
- (IBAction)btnOpenMenu:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void) loadData{

    _labelPlayas.text = NSLocalizedString(@"poi_playas", nil);
    _labelDirectorio.text = NSLocalizedString(@"poi_directorio", nil);
    _labelHosteleria.text = NSLocalizedString(@"poi_guia_hosteleria", nil);
    _labelRutasSenderismo.text = NSLocalizedString(@"poi_rutas_senderismo", nil);
    _labelRecursosHistoricos.text = NSLocalizedString(@"poi_patrimonio_historico", nil);
    _labelRecursosArqueologicos.text = NSLocalizedString(@"poi_patrimonio_arqueologico", nil);

}

-(void)loadStyle{

    [StyleBorneiro setStyleSubTitlePoi:_labelRecursosArqueologicos];
    [StyleBorneiro setStyleSubTitlePoi:_labelRecursosHistoricos];
    [StyleBorneiro setStyleSubTitlePoi:_labelRutasSenderismo];
    [StyleBorneiro setStyleSubTitlePoi:_labelHosteleria];
    [StyleBorneiro setStyleSubTitlePoi:_labelDirectorio];
    [StyleBorneiro setStyleSubTitlePoi:_labelPlayas];
    
}

-(void) loadGestures{
    UITapGestureRecognizer *tapRecursosArqueologicos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRecursosArqueologicos)];
    [self.viewRecursosArqueologico addGestureRecognizer:tapRecursosArqueologicos];
    
    UITapGestureRecognizer *tapRecursosHistoricos = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRecursosHistoricos)];
    [self.viewRecursosHistorico addGestureRecognizer:tapRecursosHistoricos];
    
    UITapGestureRecognizer *tapRutas = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openRutas)];
    [self.viewRutasSenderismo addGestureRecognizer:tapRutas];
    UITapGestureRecognizer *tapPlayas = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPlayas)];
    [self.viewPlayas addGestureRecognizer:tapPlayas];
    UITapGestureRecognizer *tapDirectorio = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openTelefonosInteres)];
    [self.viewDirectorio addGestureRecognizer:tapDirectorio];
    UITapGestureRecognizer *tapHosteleria = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openHosteleria)];
    [self.viewHosteleria addGestureRecognizer:tapHosteleria];
}


-(void)openRecursosArqueologicos{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"No disponible en estos momentos" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
   // [self performSegueWithIdentifier:kSEGUE_POI_ARQUELOGICO sender:@(kTipoPoiPatrimonioArqueologico)];
}
-(void)openRecursosHistoricos{
    NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@(kTipoPoiPatrimonioHistorico),@"tipoPoi",NSLocalizedString(@"poi_patrimonio_historico", nil),@"title", nil];
   [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:dictionary];
}
-(void)openRutas{
        NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@(kTipoPoiPoiRutasSenderismo),@"tipoPoi",NSLocalizedString(@"poi_rutas_senderismo", nil),@"title", nil];
   [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:dictionary];
}
-(void)openPlayas{
    NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@(kTipoPoiPlayas),@"tipoPoi",NSLocalizedString(@"poi_playas", nil),@"title", nil];

    [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:dictionary];
}
-(void)openHosteleria{
            NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@(kTipoPoiHoteleria),@"tipoPoi",NSLocalizedString(@"poi_guia_hosteleria", nil),@"title", nil];
     [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:dictionary];
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
            ListPoiBorneiroViewController *vc = [segue destinationViewController];
            
            // Pass any objects to the view controller here, like...
            [vc setCategoryPoi:[sender integerValue]];
        }else if([[segue identifier] isEqualToString:kSEGUE_SHOW_DETAIL]){
            DetailPoiBorneiroViewController *vc = [segue destinationViewController];
            NSDictionary *dictionary = sender;
            [vc setCategoryPoi:[[dictionary objectForKey:@"tipoPoi"] integerValue]];
            [vc setTitleSection:[dictionary objectForKey:@"title"]];
            
        }
}


@end
