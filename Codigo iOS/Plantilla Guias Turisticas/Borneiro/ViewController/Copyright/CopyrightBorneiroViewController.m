//
//  CopyrightViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 26/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CopyrightBorneiroViewController.h"
#import "CopyrightBorneiroTableController.h"
#import "UIViewController+MMDrawerController.h"

#import "StyleBorneiro.h"

@interface CopyrightBorneiroViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CopyrightBorneiroTableController * tableController;
@property (nonatomic, strong) NSArray * listData;

@end

@implementation CopyrightBorneiroViewController

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
    [StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"menu_copyright", nil) backgroundColor:[StyleBorneiro getPrimaryDarkColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadTableController{
    _tableController = [[CopyrightBorneiroTableController alloc] init];
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
