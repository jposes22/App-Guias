//
//  ComoLlegarViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ComoLlegarViewControllerBaronha.h"
#import "UIViewController+MMDrawerController.h"
#import "ConstantsURL.h"
#import "Metodos.h"
#import "GuiaDAO.h"
#import "GuiaList.h"
#import "StylesBaronha.h"
#import "Validator.h"
#import "OpenExternalApps.h"


@interface ComoLlegarViewControllerBaronha ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) GuiaList *datosComoLlegar;

@end

@implementation ComoLlegarViewControllerBaronha

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
    [StylesBaronha setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_como_llegar", nil)];
}
-(void) loadData{
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaComoLlegar];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
         _datosComoLlegar = [listGUias firstObject];
        _lblTitle.attributedText = [Metodos convertHTMLToString:_datosComoLlegar.titulo];
        _lblDescripcion.attributedText = [Metodos convertHTMLToString:_datosComoLlegar.descripcion];
        if([Validator validatePositionGPS:_datosComoLlegar.latitud andLongitud:_datosComoLlegar.longitud]){
            
            UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGoGPS)];
            tapGestureRecognizer.numberOfTapsRequired = 1;
            [_imgView addGestureRecognizer:tapGestureRecognizer];
        }else{
            [_imgView removeFromSuperview];
        }
    }else{
        [_imgView removeFromSuperview];
    }
}
-(void) loadStyle{
    //[StylesBaronha setStyleTitle:_lblTitle];
}
- (IBAction)btnMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void) tapGoGPS{
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
