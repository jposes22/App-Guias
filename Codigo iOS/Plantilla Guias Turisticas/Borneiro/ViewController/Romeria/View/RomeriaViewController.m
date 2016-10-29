//
//  RomeriaViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RomeriaViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "Constants.h"
#import "Metodos.h"
#import "NavigationBar.h"
#import "GuiaDAO.h"
#import "UtilsAppearance.h"
#import "GuiaList.h"
#import "DetalleVisitaTableController.h"
@interface RomeriaViewController ()<CommnicationMenu, CommunicationVisitaTableController>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GuiaList * guia;
@property (nonatomic, strong) DetalleVisitaTableController * tableController;

@end

@implementation RomeriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadController];
    [self loadStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(void)loadController{
    _tableController = [[DetalleVisitaTableController alloc] init];
    _tableController.listOfDetalleGuia = _guia.listOfGuiaDetalle;
    _tableController.guia = _guia;
    _tableView.delegate = _tableController;
    _tableView.dataSource = _tableController;
    _tableController.delegateTableController = self;
    //self.tableView.estimatedRowHeight = 500;
    self.tableView.estimatedRowHeight = 300;//the estimatedRowHeight but if is more this autoincremented with autolayout
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setNeedsLayout];
    [_tableView layoutIfNeeded];
}

-(void) loadData{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Romería"];
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaRomeria];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        _guia = [listGUias firstObject];
    }
}
-(void) loadStyle{
}
- (IBAction)btnOpenMenu:(id)sender {
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
