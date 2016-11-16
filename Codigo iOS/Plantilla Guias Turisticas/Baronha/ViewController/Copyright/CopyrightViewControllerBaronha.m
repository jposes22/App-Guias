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
    _listData = [[NSArray alloc] initWithObjects:NSLocalizedString(@"copyright_texto", nil), nil];
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
