//
//  RightViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "RightViewController.h"
#import "CustomTableViewCell.h"
#import "MenuObject.h"
#import "MenuHeader.h"
#import "MenuDAO.h"
#import "Menu+CoreDataProperties.h"
#import "UtilsAppearance.h"

@interface RightViewController ()
@property (nonatomic, strong) NSMutableArray *listElementsMenu;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self loadListElementsMenu];
    [self loadSettingsTableView];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadListElementsMenu) name:kNOTIFICATION_UPDATE_MENU object:nil];

}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadAppearanceTableView];
    [self.tableView reloadData];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadListElementsMenu{
    _listElementsMenu = [[NSMutableArray alloc] init];
    //cargamos el menú interior de la app/*Menu*/
    MenuObject * homeMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_home", nil) iconRow:nil idElementMenu:SideDrawerMenuItemHome];
    MenuObject * torresMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_castro", nil) iconRow:nil idElementMenu:SideDrawerMenuItemTorres];
    //MenuObject * romeriaMenu = [[MenuObject alloc] initWithTitle:@"Romería" iconRow:nil idElementMenu:SideDrawerMenuItemRomeria];
    MenuObject * poiMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_lugares", nil) iconRow:nil idElementMenu:SideDrawerMenuItemPoi];
    MenuObject * comoLlegarMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_como_llegar", nil) iconRow:nil idElementMenu:SideDrawerMenuItemComoLlegar];
    //MenuObject * galeriaMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_", nil)iconRow:nil idElementMenu:SideDrawerMenuItemGaleria];
    //MenuObject * informacionMenu = [[MenuObject alloc] initWithTitle:@"Información" iconRow:nil idElementMenu:SideDrawerMenuItemInformacion];
    MenuObject * referenciasMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_bibliografía", nil) iconRow:nil idElementMenu:SideDrawerMenuItemReferencias];
    MenuObject * copyrightMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_creditos", nil) iconRow:nil idElementMenu:SideDrawerMenuItemCopyright];
    MenuObject * ajustesMenu = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_ajustes", nil)iconRow:nil idElementMenu:SideDrawerMenuItemAjustes];
    MenuObject * reconstruccion3D = [[MenuObject alloc] initWithTitle:NSLocalizedString(@"menu_reconstrucion", nil)iconRow:nil idElementMenu:SideDrawerMenuReconstruccion3D];
    
    //creamos un dicionario provisional para buscar los elementos que vienen del servidor y enlazarlos si están activos y ponerlos en el menú si coinciden
    NSDictionary *dictionaryItemsMenu = [[NSDictionary alloc] initWithObjects:@[homeMenu, torresMenu, poiMenu,comoLlegarMenu,referenciasMenu,copyrightMenu,ajustesMenu,reconstruccion3D] forKeys:@[@(SideDrawerMenuItemHome),@(SideDrawerMenuItemTorres),@(SideDrawerMenuItemPoi),@(SideDrawerMenuItemComoLlegar),@(SideDrawerMenuItemReferencias),@(SideDrawerMenuItemCopyright),@(SideDrawerMenuItemAjustes),@(SideDrawerMenuReconstruccion3D)]];//:homeMenu, torresMenu, romeriaMenu, poiMenu, comoLlegarMenu, galeriaMenu, informacionMenu, referenciasMenu, copyrightMenu, ajustesMenu,nil];
    NSArray *listItemsMenu = [MenuDAO getMenuItems];
    for (Menu *item in listItemsMenu) {
        if([dictionaryItemsMenu objectForKey:@(item.codeMenu)]){
            [_listElementsMenu addObject:[dictionaryItemsMenu objectForKey:@(item.codeMenu)]];
        }
        
    }
    
    [self.tableView reloadData];
}
-(void) loadSettingsTableView{
    
    self.tableView.estimatedRowHeight = 20;//the estimatedRowHeight but if is more this autoincremented with autolayout
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView setNeedsLayout];
    [self.tableView layoutIfNeeded];
    [[UITableView appearance] setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listElementsMenu.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    /* Section header is in 0th index... */
    [view addSubview:label];
    //  [view setBackgroundColor:[UtilsAppearance getColorDarkApp]]; //your background color...
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"customCellIdentify"];
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"customCellIdentify"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"customCellIdentify"];
    }
    cell.labelTitle.text = [[_listElementsMenu objectAtIndex:indexPath.row] titleRow];
    cell.imageViewIcon.image = [[_listElementsMenu objectAtIndex:indexPath.row] iconRow];
    
    return cell;
}

-(void)changeCenterViewController{
    if(_delegateRightMenu && [_delegateRightMenu respondsToSelector:@selector(changeCenterViewControllerWithMenu:)]){
        [_delegateRightMenu changeCenterViewControllerWithMenu:SideDrawerMenuItemHome];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_delegateRightMenu && [_delegateRightMenu respondsToSelector:@selector(changeCenterViewControllerWithMenu:)]){
        [_delegateRightMenu changeCenterViewControllerWithMenu:[[_listElementsMenu objectAtIndex:indexPath.row] idElementMenu]];
    }
}



#pragma mark - UtilsAppearance
-(void) loadAppearanceTableView{
    self.tableView.backgroundColor = [UtilsAppearance getPrimaryLightColor];
    /*self.view.backgroundColor = [UtilsAppearance getColorDarkApp];*/
    [self.tableView setShowsVerticalScrollIndicator:NO];
}

@end
