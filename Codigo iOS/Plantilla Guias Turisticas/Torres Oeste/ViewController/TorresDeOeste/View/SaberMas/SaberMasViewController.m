//
//  SaberMasViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SaberMasViewController.h"
#import "ConstantsURL.h"
#import "Metodos.h"
#import "NavigationBar.h"
#import "GuiaSaberMasDAO.h"
#import "UtilsAppearance.h"
#import "GuiaSaberMasList.h"
#import "SaberMasTableController.h"
@interface SaberMasViewController ()<CommunicationSaberMasTableController>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (nonatomic, strong) GuiaSaberMasList * guia;
@property (nonatomic, strong) SaberMasTableController * tableController;
@end

@implementation SaberMasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    _tableController = [[SaberMasTableController alloc] init];
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
    [_tableView reloadData];
}

-(void) loadData{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_como_torres", nil)];
    _labelSubtitle.text = NSLocalizedString(@"subtitle_saber_mas", nil);
    NSArray *listGuiasSaberMas = [GuiaSaberMasDAO getGuiasSaberMas:_idGuiaDetalle];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGuiasSaberMas.count > 0){
        _guia = [listGuiasSaberMas firstObject];
    }
}
-(void) loadStyle{
    [_viewTop setBackgroundColor:[UtilsAppearance getPrimaryDarkColor]];
    [UtilsAppearance setSytleSubtitle:_labelSubtitle];
    _labelSubtitle.textColor = [UIColor whiteColor];
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
