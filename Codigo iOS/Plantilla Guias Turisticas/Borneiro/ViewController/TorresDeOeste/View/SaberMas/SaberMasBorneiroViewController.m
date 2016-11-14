//
//  SaberMasViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 13/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SaberMasBorneiroViewController.h"
#import "ConstantsURL.h"
#import "Metodos.h"
#import "NavigationBar.h"
#import "GuiaSaberMasDAO.h"
#import "StyleBorneiro.h"
#import "SaberMasBorneiroTableController.h"
#import <AVFoundation/AVFoundation.h>

@interface SaberMasBorneiroViewController ()<CommunicationSaberMasBorneiroTableController>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, strong) SaberMasBorneiroTableController * tableController;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;

@end

@implementation SaberMasBorneiroViewController

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
    _tableController = [[SaberMasBorneiroTableController alloc] init];
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
    [StyleBorneiro setStyleNavigationBarSaberMas:self.navigationBar withTitle:NSLocalizedString(@"menu_visita", nil)];
    _labelSubtitle.text = NSLocalizedString(@"subtitle_saber_mas", nil);
}
-(void) loadStyle{
    [_viewTop setBackgroundColor:[StyleBorneiro getVerdeClaroVisita]];
    [StyleBorneiro setSytleSubtitle:_labelSubtitle];
    _labelSubtitle.textColor = [UIColor whiteColor];
    [_navigationBar setBarTintColor:[StyleBorneiro getPrimaryDarkColor]];
}
- (void) comunicationPlayAudioGuia:(GuiaSaberMas *)guia{
    if (_audioPlayer != nil){
        
        if([_audioPlayer isPlaying]){
            [_audioPlayer pause];
            
        }else{
            [_audioPlayer play];
            
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
            [[AVAudioSession sharedInstance]
             setCategory: AVAudioSessionCategoryPlayback
             error: nil];
        }
    }
    
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
