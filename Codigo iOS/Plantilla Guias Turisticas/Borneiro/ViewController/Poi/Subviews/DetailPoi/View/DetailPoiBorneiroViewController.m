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
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "StyleBorneiro.h"
#import "PoiImagen+CoreDataProperties.h"
#import "AlbumViewController.h"
#import "PoiImagenDAO.h"


@interface DetailPoiBorneiroViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewList;
@property (nonatomic, strong) NSArray *listImages;
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
    if(!_poi){
        
       NSArray * listPoi = [PoiDAO getPoiByCategory:_categoryPoi];
        _poi = [listPoi firstObject];
    }
    if(_poi){
        
        _labelText.attributedText = [Metodos convertHTMLToString:_poi.descripcion];
        
        if(_poi.titulo){
            _labelTitle.attributedText = [Metodos convertHTMLToString:_poi.titulo];
        }else{
            [_labelTitle removeFromSuperview];
        }
        if(_poi.urlImagen){
            [_imageView sd_setImageWithURL:[[NSURL alloc] initWithString:_poi.urlImagen] placeholderImage:[UIImage imageNamed:@"" ]];
        }else{
            [_imageView removeFromSuperview];
        }
        
         _listImages = [PoiImagenDAO getPoiImagenesByidPoi:_poi.idPoi];
        if(_listImages && _listImages.count > 0){
            //////
            NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [path stringByAppendingString:((PoiImagen *)[_listImages firstObject]).urlImagen];
            _imageViewList.image = [UIImage imageWithContentsOfFile:path ];
            
            UITapGestureRecognizer *tapListImages = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAlbum)];
            [self.imageViewList addGestureRecognizer:tapListImages];
           
        }else{
            [_imageViewList removeFromSuperview];
        }
    }else{
        [_imageViewList removeFromSuperview];
    }

    
    
}
- (void) loadStyle{
    //[StyleBorneiro setStyleText:_labelText];
   // [StyleBorneiro setStyleSubTitlePoi:_labelTitle];
    //[StyleBorneiro setStyleNavigationBar:self.navigationController.navigationBar withTitle:_titleSection backgroundColor:[StyleBorneiro getVerdeOscuroPoi]];
}
-(void) openAlbum{
    AlbumViewController *album = [AlbumViewController new];
    [album setListfOfImage:_listImages];
    [self presentViewController:album animated:YES completion:nil];
    
}


@end
