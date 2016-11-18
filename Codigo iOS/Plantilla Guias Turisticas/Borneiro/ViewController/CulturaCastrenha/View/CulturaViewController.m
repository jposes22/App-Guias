//
//  RomeriaViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 23/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "CulturaViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ConstantsURL.h"
#import "Metodos.h"
#import "NavigationBar.h"
#import "GuiaDAO.h"
#import "StyleBorneiro.h"
#import "GuiaList.h"
#import "CulturaTableController.h"
#import "AlbumViewController.h"
#import "Settings.h"
#import <AVFoundation/AVFoundation.h>
#import "Constants.h"
#import "SaberMasBorneiroViewController.h"
@interface CulturaViewController ()<CommnicationMenu, CommunicationCulturaTableController, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GuiaList * guia;
@property (nonatomic, strong) CulturaTableController * tableController;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;


@end

@implementation CulturaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadController];
    [self loadStyle];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openSaberMas:) name:kNOTIFICATION_GO_TO_SABER_MAS object:nil];
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(_audioPlayer && [_audioPlayer isPlaying]){
        [_audioPlayer stop];
        [[Settings sharedInstance] setIsPlaying:NO];
        
    }

}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(void)loadController{
    _tableController = [[CulturaTableController alloc] init];
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
    [StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"menu_cultura_castrenha", nil) backgroundColor:[StyleBorneiro getVerdeOscuroCultura]];
    NSArray *listGUias = [GuiaDAO getGuiasByTipo:kTipoGuiaCultura];
    //aquí solo necesitaremos la primera que venga ya que si hay más es un error del que metió los datos
    if(listGUias.count > 0){
        _guia = [listGUias firstObject];
    }
}
- (void) communicationImageSelected:(NSArray *)list{
    AlbumViewController * viewController = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
    viewController.listfOfImage = list;
    [self presentViewController:viewController animated:YES completion:nil];
}
-(void) loadStyle{
}
- (IBAction)btnOpenMenu:(id)sender {
     [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
- (void) comunicationPlayAudioGuia:(Guia *)guia{
    if (_audioPlayer != nil){
        
        if([_audioPlayer isPlaying]){
            [_audioPlayer pause];
            [[Settings sharedInstance] setIsPlaying:NO];
            
            
        }else{
            [_audioPlayer play];
            [[Settings sharedInstance] setIsPlaying:YES];
            
        }
    }else{
        [self playGuide:guia];
    }
}
-(void)playGuide:(Guia *)guia{
    NSError *error;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(guia.urlAudioGuia){
        path = [path stringByAppendingPathComponent:guia.urlAudioGuia];
        
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
        _audioPlayer.delegate = self;

        if (_audioPlayer == nil){
            NSLog(@"%@", [error description]);
        }else{
            [_audioPlayer play];
            [[Settings sharedInstance] setIsPlaying:YES];
            
            [[AVAudioSession sharedInstance]
             setCategory: AVAudioSessionCategoryPlayback
             error: nil];
        }
    }
    
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if(flag){
        [[Settings sharedInstance] setIsPlaying:NO];
        [_tableView reloadData];
        
    }
}
#pragma mark - Notification methods
- (void) openSaberMas:(NSNotification *)notification{
    if([notification.name isEqualToString:kNOTIFICATION_GO_TO_SABER_MAS]){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"GuiasBorneiro" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SaberMasBorneiroViewController"];
        ((SaberMasBorneiroViewController *)vc).guia = notification.object;
        ((SaberMasBorneiroViewController *)vc).titleSection = NSLocalizedString(@"menu_cultura_castrenha", nil);
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
