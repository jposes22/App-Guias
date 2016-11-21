//
//  ReferenciasViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 27/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ReferenciasViewController.h"
#import "UtilsAppearance.h"
#import "UIViewController+MMDrawerController.h"
#import "Metodos.h"
#import "GuiaDAO.h"
#import "ConstantsURL.h"


@interface ReferenciasViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelTexto;
@property (nonatomic,strong) Guia *datosReferencias;


@end

@implementation ReferenciasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self setNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setNavigationBar{
   [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_bibliografía", nil)];
    
}
- (void) loadData{
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaReferencias];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        _datosReferencias = [listGUias firstObject];
        _labelTitulo.attributedText = [Metodos convertHTMLToString: _datosReferencias.titulo];
        _labelTexto.attributedText = [Metodos convertHTMLToString:_datosReferencias.descripcion];
    }else{
        _labelTexto.text = @"";
        _labelTitulo.text = @"";
    }
}
- (IBAction)btnMenuTouch:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
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
