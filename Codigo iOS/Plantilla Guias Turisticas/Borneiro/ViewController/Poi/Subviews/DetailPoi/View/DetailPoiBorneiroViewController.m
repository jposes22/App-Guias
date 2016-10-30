//
//  DetailPoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "DetailPoiBorneiroViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "PoiDAO.h"
#import "Poi+CoreDataClass.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "StyleBorneiro.h"




@interface DetailPoiBorneiroViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (nonatomic, strong) Poi * poi;
@end

@implementation DetailPoiBorneiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnOpenMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
- (void)loadData{
   NSArray * listPoi = [PoiDAO getPoiByCategory:_categoryPoi];
    if(listPoi){
        _poi = [listPoi firstObject];
        _labelText.attributedText = [Metodos convertHTMLToString:_poi.descripcion];
        if(_poi.titulo){
            _labelTitle.text = _poi.titulo;
        }else{
            [_labelTitle removeFromSuperview];
        }
    if(_poi.urlImagen){
        [_imageView sd_setImageWithURL:[[NSURL alloc] initWithString:_poi.urlImagen] placeholderImage:[UIImage imageNamed:@"" ]];
    }else{
        [_imageView removeFromSuperview];
    }
    }
}

- (void) loadStyle{
    [StyleBorneiro setStyleText:_labelText];
    [StyleBorneiro setStyleSubTitlePoi:_labelTitle];
    [StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:_titleSection backgroundColor:[StyleBorneiro getVerdeOscuroPoi]];
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
