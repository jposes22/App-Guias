//
//  CopyrightViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "UtilsAppearance.h"
#import "GuiaDAO.h"
#import "Metodos.h"
#import "ConstantsURL.h"

@interface CopyrightViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (nonatomic,strong) Guia *datosCopyright;

@end

@implementation CopyrightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
    [self loadData];
}
- (void) loadData {
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaCopyright];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        _datosCopyright = [listGUias firstObject];
        _labelTitle.attributedText = [Metodos convertHTMLToString: _datosCopyright.titulo];
        _labelText.attributedText = [Metodos convertHTMLToString:_datosCopyright.descripcion];
    }else{
        _labelText.text = @"";
        _labelTitle.text = @"";
    }
}
- (void)setNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_copyright", nil)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
