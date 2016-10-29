//
//  SlideGuide.m
//  TorresDeOeste
//
//  Created by Evelb on 15/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SlideGuideBaronha.h"
#import "Guia+CoreDataClass.h"
#import "UtilsAppearance.h"
#import "GuiaDetalleTableController.h"
#import "GuiaDetalleDAO.h"
#import "AlbumViewController.h"
#import <AVFoundation/AVFoundation.h>



@interface SlideGuideBaronha ()<CommunicationTableController>
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UIImageView *imageAudio;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) GuiaDetalleTableController * tableController;
@property (nonatomic, strong) NSArray * listOfGuiaDetalle;
@property (nonatomic, strong) AVAudioPlayer * audioPlayer;


//@property (nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation SlideGuideBaronha

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
    [_tableView reloadData];

}
- (void)loadStyle{

}
- (void)loadData{
    _listOfGuiaDetalle = _guiaList.listOfGuiaDetalle;
    [self loadController];
    
}
- (void)loadController{
    _tableController = [[GuiaDetalleTableController alloc] init];
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
        if (_audioPlayer == nil){
            NSLog(@"%@", [error description]);
        }else{
            [_audioPlayer play];
        }
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
