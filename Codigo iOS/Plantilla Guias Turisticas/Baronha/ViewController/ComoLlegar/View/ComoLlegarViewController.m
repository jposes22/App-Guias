//
//  ComoLlegarViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ComoLlegarViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "Constants.h"
#import "Metodos.h"
#import "GuiaDAO.h"
#import "UtilsAppearance.h"

@interface ComoLlegarViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;


@end

@implementation ComoLlegarViewController

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
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Cómo llegar"];

}
-(void) loadData{
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaComoLlegar];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        Guia *datosComoLlegar = [listGUias firstObject];
        _lblTitle.text = datosComoLlegar.titulo;
        _lblDescripcion.attributedText = [Metodos convertHTMLToString:datosComoLlegar.descripcion];
    }
}
-(void) loadStyle{
    [UtilsAppearance setStyleTitle:_lblTitle];
}
- (IBAction)btnMenu:(id)sender {
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
