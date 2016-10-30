//
//  CopyrightViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightViewControllerBaronha.h"
#import "CopyrightTableController.h"
#import "UIViewController+MMDrawerController.h"

#import "UtilsAppearance.h"

@interface CopyrightViewControllerBaronha ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CopyrightTableController * tableController;
@property (nonatomic, strong) NSArray * listData;

@end

@implementation CopyrightViewControllerBaronha

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadStyle];
    [self loadData];
    [self loadTableController];
}
- (void) loadData {
    _listData = [[NSArray alloc] initWithObjects:@"<span style='font-family: Open Sans; color: rgb(91, 91, 95); font-size: 20px;'><br>La propiedad intelectual de esta App pertenece al Ayuntamiento de Catoira y fue realiza por Tictura.<br><br>Cualquier forma de reproducción distribución, comunicación pública o transformación de esta obra solo puede ser realizada con laautorización de sus titulares, salvo excepción prevista por la ley. Sí necesitas citarla, se recomienda hacerlo de la siguiente manera:<br>Torres de Oeste. Aplicación móvil desarrollada por el Ayuntamiento de Catoira.<br></span><br><br>", nil];
}
-(void)loadStyle{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Copyright"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadTableController{
    _tableController = [[CopyrightTableController alloc] init];
    _tableView.delegate = _tableController;
    _tableView.dataSource = _tableController;
    _tableController.listCopyRight = _listData;
    [_tableView reloadData];
    self.tableView.estimatedRowHeight = 150;//the estimatedRowHeight but if is more this autoincremented with autolayout
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setNeedsLayout];
    [_tableView layoutIfNeeded];
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
