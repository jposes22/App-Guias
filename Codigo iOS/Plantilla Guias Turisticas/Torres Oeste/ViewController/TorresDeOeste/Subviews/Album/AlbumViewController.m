//
//  AlbumViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "AlbumViewController.h"
#import "AlbumPagerController.h"

@interface AlbumViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewSlide;
@property (nonatomic, strong) AlbumPagerController * pagerController;
@property (weak, nonatomic) IBOutlet UIView *btnClose;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor blackColor]];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadSlide];
}

#pragma mark - Notifications Methods
-(void)loadSlide{
    [_btnClose bringSubviewToFront:self.view];
    [self inicializarSlide];
}
-(void)inicializarSlide{
    self.pagerController = [[AlbumPagerController alloc]init];
    CGRect frame = CGRectMake(0, 0, _viewSlide.frame.size.width, _viewSlide.frame.size.height);
    self.pagerController.frame = frame;
    [[self.pagerController view]setFrame:frame];
    self.pagerController.listImages  = _listfOfImage;
    [self.viewSlide addSubview:self.pagerController.view];
    [self.pagerController initPageController];
    
}
- (IBAction)btnCloseTouch {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
