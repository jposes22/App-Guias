//
//  GuiaViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "GuiaViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "PageController.h"
#import "GuiaDAO.h"
#import "ConstantsURL.h"
#import "Constants.h"
#import "CollectionController.h"
#import "NavigationBar.h"
#import "UtilsAppearance.h"
#import "AlbumViewController.h"
#import "SaberMasViewController.h"
#import "GuiaDetalleList.h"

@interface GuiaViewController ()<CommnicationMenu, ComunicationChangePage, CommunicationCollectionCell>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *viewSlide;
@property (nonatomic, strong) PageController * pagerController;
@property (nonatomic, strong) NSArray * listGuias;
@property (nonatomic, strong) CollectionController *collectionController;

@end

@implementation GuiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
   // [self setStyleNavigationBar];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openAlbum:) name:@"OPEN_ALBUM" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openSaberMas:) name:kNOTIFICATION_GO_TO_SABER_MAS object:nil];
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(!_pagerController){
        [self loadSlide];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Load data
-(void)setNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Torres do Oeste"];
}

#pragma mark - Style navigation bar

#pragma mark - Notifications Methods
-(void)loadSlide{
    _listGuias = [[NSArray alloc]initWithArray:[GuiaDAO getGuiasByTipo:kTipoGuiaTorresOeste]];
    [self inicializarSlide];
    [self loadCollection];
}
-(void)loadCollection{
    _collectionController = [[CollectionController alloc] init];
    [_collectionView registerNib:[UINib nibWithNibName:@"CellGuiaCollectionView" bundle:nil] forCellWithReuseIdentifier:@"CellGuiaCollectionView"];
    _collectionView.delegate = _collectionController;
    _collectionView.dataSource = _collectionController;
    _collectionController.pageSelected = 0;
    _collectionController.delegateCollection = self;
    _collectionController.listOfGuides = _listGuias;
    
    [_collectionView reloadData];
    
}
-(void)loadNavigationBar{
   }
-(void)inicializarSlide{
    self.pagerController = [[PageController alloc]init];
    CGRect frame = CGRectMake(0, 0, _viewSlide.frame.size.width, _viewSlide.frame.size.height-40);
    self.pagerController.frame = frame;
    [[self.pagerController view]setFrame:frame];
    self.pagerController.listGuide  = _listGuias;
    _pagerController.delegatePager = self;
    [self.viewSlide addSubview:self.pagerController.view];
    [self.pagerController initPageController];
    
}
#pragma markk - communication methods
-(void)changePage:(NSUInteger)page{
    _collectionController.pageSelected = page;
    [_collectionView reloadData];
    
}
-(void)goToPage:(NSUInteger)page{
    [self.pagerController goToPage:page];
    _collectionController.pageSelected = page;
    [_collectionView reloadData];
    
}
- (IBAction)btnMenuTouch:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
#pragma mark - Notification methods
- (void) openAlbum:(NSNotification *)notification{
    AlbumViewController * viewController = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
    viewController.listfOfImage = notification.object;
    [self presentViewController:viewController animated:YES completion:nil];
}
#pragma mark - Notification methods
- (void) openSaberMas:(NSNotification *)notification{
    if([notification.name isEqualToString:kNOTIFICATION_GO_TO_SABER_MAS]){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Guias" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SaberMasViewController"];
        ((SaberMasViewController *)vc).guia = notification.object;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
        
    }
   
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
