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
#import "SaberMasTableController.h"
#import "AlbumViewController.h"
#import "Settings.h"
#import <AVFoundation/AVFoundation.h>

@interface SaberMasViewController ()<CommunicationSaberMasTableController>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, strong) SaberMasTableController * tableController;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;

@end

@implementation SaberMasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self loadController];
    [self loadStyle];
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(_audioPlayer && [_audioPlayer isPlaying]){
        [_audioPlayer stop];
        [[Settings sharedInstance] setIsPlaying:NO];
        
    }
    
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
    [UtilsAppearance setStyleNavigationBarSaberMas:self.navigationBar withTitle:NSLocalizedString(@"title_como_torres", nil)];
    _labelSubtitle.text = NSLocalizedString(@"subtitle_saber_mas", nil);
}
-(void) loadStyle{
    [_viewTop setBackgroundColor:[UtilsAppearance getPrimaryColor]];
    [UtilsAppearance setSytleSubtitle:_labelSubtitle];
    _labelSubtitle.textColor = [UIColor whiteColor];
    [_navigationBar setBarTintColor:[UtilsAppearance getPrimaryColor]];
}
- (void) comunicationPlayAudioGuia:(GuiaSaberMas *)guia{
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
-(void)playGuide:(GuiaSaberMas *)guia{
    NSError *error;
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(guia.urlAudioGuia){
        path = [path stringByAppendingPathComponent:guia.urlAudioGuia];
        
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
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
-(void) communicationImageSelected:(NSArray *)list{
    AlbumViewController * viewController = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
    viewController.listfOfImage =list;
    [self presentViewController:viewController animated:YES completion:nil];
    
    
}

- (IBAction)btnClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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