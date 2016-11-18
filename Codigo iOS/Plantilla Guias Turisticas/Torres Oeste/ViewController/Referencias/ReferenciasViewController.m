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
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_bibliografía", nil)];
    _labelTitulo.text = NSLocalizedString(@"title_bibliografía", nil);
    
    _labelTexto.attributedText = [Metodos convertHTMLToString:NSLocalizedString(@"referencias_texto", nil)];
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
