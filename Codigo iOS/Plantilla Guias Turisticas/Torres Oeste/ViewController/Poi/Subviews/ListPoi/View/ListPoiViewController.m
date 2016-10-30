//
//  ListPoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 22/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ListPoiViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "PoiTableController.h"
#import "DetailPoiViewController.h"
#import "NavigationBar.h"
#import "UtilsAppearance.h"
#import "Constants.h"


#import "PoiDAO.h"

@interface ListPoiViewController ()<CommunicationControllerPoi>

@property (weak, nonatomic) IBOutlet UITableView *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) PoiTableController *poiTableController;

@end

@implementation ListPoiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadController];
    [self loadNavigationBar];
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
    _poiTableController = [PoiTableController new];
    _poiTableController.delegatePoi = self;
    _tableView.delegate = _poiTableController;
    _tableView.dataSource = _poiTableController;
    _poiTableController.listOfPois = [PoiDAO getPoiByCategory:_categoryPoi];
}

-(void)loadNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_lugares", nil)];
}
- (IBAction)btnOpenMenu:(id)sender {
   [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)communicationPoiSelected:(Poi *) poiSelected{
    [self performSegueWithIdentifier:kSEGUE_POI sender:poiSelected];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:kSEGUE_POI])
    {
        // Get reference to the destination view controller
        DetailPoiViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setPoiSelected:sender ];
    }
}
@end
