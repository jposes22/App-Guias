//
//  ComoLlegarBorneiroViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ComoLlegarBorneiroViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "Constants.h"
#import "Metodos.h"
#import "GuiaDAO.h"
#import "StyleBorneiro.h"
#import "OpenExternalApps.h"
@interface ComoLlegarBorneiroViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) Guia * datosComoLlegar;
@end

@implementation ComoLlegarBorneiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
    [self setNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationBar{
    [StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"menu_como_llegar", nil) backgroundColor:[StyleBorneiro getVerdeOscuroComoLlegar]];
    
}
-(void) loadData{
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaComoLlegar];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        _datosComoLlegar = [listGUias firstObject];
        _lblTitle.text = _datosComoLlegar.titulo;
        _lblDescripcion.attributedText = [Metodos convertHTMLToString:_datosComoLlegar.descripcion];
        if(_datosComoLlegar.latitud > 0 && _datosComoLlegar.longitud > 0){
            _imgView.image = [UIImage imageNamed:@"btnAbrirMapa"];
            UITapGestureRecognizer * abrirEnMapa =  [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapVerEnMapa:)];
            abrirEnMapa.numberOfTapsRequired = 1;
            [self.imgView addGestureRecognizer:abrirEnMapa];
        }else{
            [_imgView removeFromSuperview];
        }
    }
}
-(void) loadStyle{
    [StyleBorneiro setStyleTitleComoLlegar:_lblTitle];
    [StyleBorneiro setStyleText:_lblDescripcion];
}
- (IBAction)btnMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
- (void)tapVerEnMapa:(UITapGestureRecognizer *)tap{
    [OpenExternalApps openGPSWithLatitud:_datosComoLlegar.latitud andLongitud:_datosComoLlegar.longitud];
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
