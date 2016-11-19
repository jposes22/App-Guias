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

#import "Constants.h"
#import "ConstantsURL.h"
#import "DetailPoiBorneiroViewController.h"

#import "PoiDAO.h"

@interface ListPoiBorneiroViewController ()<CommnicationMenu,CommunicationControllerPoiBorneiro>

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
    _poiTableController.isSinglePoi = _isSinglePoi;
    _poiTableController.delegatePoi = self;
    _tableView.delegate = _poiTableController;
    _tableView.dataSource = _poiTableController;
    _poiTableController.listOfPois = [PoiDAO getPoiByCategory:_categoryPoi];
}
- (IBAction)btnOpenMenu:(id)sender {
   [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
-(void) communicationPoiSelected:(Poi *)poi{
      [self performSegueWithIdentifier:kSEGUE_SHOW_DETAIL sender:poi];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // Make sure your segue name in storyboard is the same as this line

    if([[segue identifier] isEqualToString:kSEGUE_SHOW_DETAIL]){
        DetailPoiBorneiroViewController *vc = [segue destinationViewController];
        [vc setPoi:sender];
        
    }
}


@end
