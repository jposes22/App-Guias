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


@interface ReferenciasViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelTexto;
@property (nonatomic, strong) NSString * staticText;

@end

@implementation ReferenciasViewController

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
- (void) loadData{
    _labelTitulo.text = @"Bibliografía";
    _staticText = [NSString stringWithFormat:@"<span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Andrade Cernadas, J. M. 2004. <span style='font-weight: bold;'>La iglesia de Iria-Santiago, el mar y las fortalezas costeras de la Galicia Medieval</span>.En Padrón, Iria y las tradiciones jacobeas. Xunta de Galicia.<br><br>Balil Illana, A. 1971. <span style='font-weight: bold;'>Excavaciones en Torres de Oeste de Catoira (Pontevedra)</span>. Noticiario Arqueológico Hispánico, XIII-XIV (1969-70), pp. 300-303.<br><br>Balil Illana, A. 1977. <span style='font-weight: bold;'>Torres de Oeste, Catoira (Pontevedra) 1973</span>. Noticiario Arqueológico Hispánico, Arqueología 5, pp. 379-385.<br><br>Burgoa Fernández, J. J. 2014. <span style='font-weight: bold;'>Catoira y la armada gallega de Diego Gelmírez. Las Torres de Oeste y la Romería Vikinga</span>. Central Librera y Concello de Catoira.<br><br>Caamaño Gesto, J. M. y Naveiro López, J. 1991. <span style='font-weight: bold;'>El depósito subacuático del río Ulla. El material romano.</span> En Finis Terrae. Estudios en lembranza do Profesor Dr. Alberto Balil. Universidad de Santiago de Compostela.<br><br>Chamoso Lamas, M. 1951. <span style='font-weight: bold;'>Excavaciones en Torres de Oeste (Catoira, Pontevedra). </span>Cuaderno de Estudios Gallegos, XIX, pp 283-285.<br><br>Chamoso Lamas, M. 1999. <span style='font-weight: bold;'>Excavacionesen Torres de Oeste (Catoira, Pontevedra).</span> Pontevedra no obxectivo de Manuel Chamoso Lamas. As nosas Raíces. Museo de Pontevedra. Deputación de Pontevedra. pp 109-110.<br><br>Hervés Raigoso, F. M. 2011. <span style='font-weight: bold;'>Controlde remoción de tierras, sondeos valorativos y excavación en área. Actuación en el conjunto histórico monumental Torres de Oeste, Catoira.</span> Informe inédito de excavación. Xunta de Galicia.<br><br>Navaza, G. 2007. <span style='font-weight: bold;'>Toponimia de Catoira</span>.Concello de Catoira.<br><br>Naveiro López, J. 2004. <span style='font-weight: bold;'>Torres de Oeste. Monumento Histórico e Xacemento Arqueolóxico.</span> Diputación Provincial de Pontevedra y Concello de Catoira.<br><br>Sánchez Pardo, J. C. 2014. <span style='font-weight: bold;'>Sistema de señales a larga distancia. Estudio de topónimos faro, facho y meda en le Noroeste Peninsular.</span> En Las fortificaciones en la tardoantigüedad. Élites y articulación del territorio (siglos V-VIII d.C). La Ergástula ediciones. <br><br>Sánchez Pardo, J. C. 2010. <span style='font-weight: bold;'>Losataques vikingos y su influencia en la Galicia de los siglos IX-XI.</span> Anuario Brigantino nº 33. <br><br>Singul, F. 2011. <span style='font-weight: bold;'>Catoira. Chave e selo de Galicia</span>. Concello de Catoira.<br><br>Singul, F. 2014. <span style='font-weight: bold;'>Diego Gelmírez.Señor de Torres de Oeste.</span> Concello de Catoira.<br><br></span><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Textos</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Tictura</span><br> <br><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Asesoría</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Juan Naveiro López</span><br><br><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Ilustraciones</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Iñaki Diéguez Uribeondo</span><br><br><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Mapas</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Anxo Rodríguez Paz (Incipit-CSIC)</span><br><br><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Revisión ortográfica y de estilo</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Manuel González Alvarellos</span><br><br><span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Dibujos selfie</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Juan Venditti</span><br><br> <span style='color: rgb(9, 79, 107); font-family: Caviar Dreams; font-size:25px'>Fotografías</span> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Concello de Catoira</span><br> <span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'>Juan Naveiro López</span><br><span style='font-family: Open Sans; color: rgb(91, 91, 95);font-size:20px'> Tictura</span><br><br>"];
    
    _labelTexto.attributedText = [Metodos convertHTMLToString:_staticText];
}
- (IBAction)btnMenuTouch:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void) loadStyle{
    [UtilsAppearance setStyleTitle:_labelTitulo];
    [UtilsAppearance setStyleText:_labelTexto];


    
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
