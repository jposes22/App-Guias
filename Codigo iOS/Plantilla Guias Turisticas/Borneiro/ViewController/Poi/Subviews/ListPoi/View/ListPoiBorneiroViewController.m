//
//  ListPoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ListPoiBorneiroViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "PoiBorneiroTableController.h"
#import "NavigationBar.h"


#import "PoiDAO.h"

@interface ListPoiBorneiroViewController ()<CommnicationMenu>

@property (weak, nonatomic) IBOutlet UITableView *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) PoiBorneiroTableController *poiTableController;

@end

@implementation ListPoiBorneiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadController];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) loadController{
    _poiTableController = [PoiBorneiroTableController new];
    _tableView.delegate = _poiTableController;
    _tableView.dataSource = _poiTableController;
    _poiTableController.listOfPois = [PoiDAO getPoiByCategory:_categoryPoi];
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
