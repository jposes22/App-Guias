//
//  SlideGuideBorneiro.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 29/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SlideGuideBorneiro.h"
#import "Guia+CoreDataClass.h"
#import "DetalleVisitaTableController.h"
#import "GuiaDetalleDAO.h"
#import "AlbumViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Settings.h"
@interface SlideGuideBorneiro ()<CommunicationVisitaTableController, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) DetalleVisitaTableController * tableController;
@property (nonatomic, strong) NSArray * listOfGuiaDetalle;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;
@end

@implementation SlideGuideBorneiro

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadStyle];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // [_tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   //
    [_tableView reloadData];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(_audioPlayer && [_audioPlayer isPlaying]){
        [_audioPlayer stop];
        [[Settings sharedInstance] setIsPlaying:NO];
        
    }
}
- (void)loadStyle{
    
}
- (void)loadData{
    _listOfGuiaDetalle = _guiaList.listOfGuiaDetalle;
    [self loadController];
    
}
- (void)loadController{
    _tableController = [[DetalleVisitaTableController alloc] init];
    _tableController.listOfDetalleGuia = _listOfGuiaDetalle;
    _tableController.guia = _guiaList;
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
-(void) communicationImageSelected:(NSArray *)list{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OPEN_ALBUM" object:list userInfo:nil];
    
    /*AlbumViewController * viewController = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
     viewController.listfOfImage = list;
     [self presentViewController:viewController animated:YES completion:nil];*/
}
- (void) comunicationPlayAudioGuia:(Guia *)guia{
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
        }
    }
    
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if(flag){
        [[Settings sharedInstance] setIsPlaying:NO];
        [_tableView reloadData];

    }
}

@end
