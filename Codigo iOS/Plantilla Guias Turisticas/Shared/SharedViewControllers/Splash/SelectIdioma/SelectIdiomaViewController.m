//
//  SelectIdiomaViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 13/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SelectIdiomaViewController.h"
#import "TableIdiomaController.h"
#import "Idioma+CoreDataClass.h"
#import "Settings.h"
#import "UtilsAppearance.h"

#import "IdiomaDAO.h"
#import "NSBundle.h"

@interface SelectIdiomaViewController ()<CommunicationControllerIdioma>
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirmar;

@property (nonatomic, strong) TableIdiomaController * tableController;
@property (nonatomic, strong) Idioma * idioma;
@property (nonatomic, strong) NSArray * listOfIdiomas;

@end

@implementation SelectIdiomaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadController];
    [self loadInitialData];
    [self loadStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}
- (void)loadInitialData{
    
    _labelTitulo.text = NSLocalizedString(@"arranque_title_idioma",nil);
    _btnConfirmar.enabled = NO;
    [_btnConfirmar setTitle: NSLocalizedString(@"arranque_button_select",nil) forState:UIControlStateNormal];
    
}
- (void)loadStyle{
    [UtilsAppearance setStyleTitle:_labelTitulo];
    [UtilsAppearance setStyleButtonText:_btnConfirmar];
    [_btnConfirmar setBackgroundColor:[UtilsAppearance getSecondaryColor]];
    [_btnConfirmar.layer setCornerRadius:8.0];
}
- (void)loadController{
    _tableView.estimatedRowHeight = 44.0;
    _listOfIdiomas = [IdiomaDAO getIdiomas];
    _tableController = [[TableIdiomaController alloc] init];
    _tableView.delegate = _tableController;
    _tableView.dataSource = _tableController;
    _tableController.delegateIdioma = self;
    _tableController.listOfIdiomas = _listOfIdiomas;
    [_tableView layoutIfNeeded];
}

#pragma mark - Communication Idioma selected
- (void)communicationIdiomaSelected:(NSInteger)index{
    _idioma = [_listOfIdiomas objectAtIndex:index];
    _btnConfirmar.enabled = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnConfirmarTouch {
    
    //Guardamos el idioma seleccionado
    [[Settings sharedInstance] setIdioma: _idioma.codigoIdioma];
    [[Settings sharedInstance] saveSettings];
    [NSBundle setLanguage:_idioma.codigoIdioma];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATION_IDIOMA_ELEGIDO" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
