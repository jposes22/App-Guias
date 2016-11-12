//
//  DetailPoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "DetailPoiViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "Metodos.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UtilsAppearance.h"

#import "PoiDAO.h"
#import "PoiImagenDAO.h"

#import "AlbumViewController.h"

@interface DetailPoiViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescripcion;

@property (weak, nonatomic) IBOutlet UIImageView *imgViewListImages;
@property (strong, nonatomic) NSArray *listImages;


@end

@implementation DetailPoiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
    [self loadNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadStyle{
   // [UtilsAppearance setStyleTitleList:_lblTitle];
    

}
-(void)loadNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:NSLocalizedString(@"title_lugares", nil)];
}
-(void)loadData{
    
     NSArray *listOfPois = [PoiDAO getPoiByCategory:_categoryPoi];
    if(listOfPois && [listOfPois count] > 0){
        _poiSelected = listOfPois.firstObject;
    
        _lblTitle.attributedText  = [Metodos convertHTMLToString:_poiSelected.titulo];
        _lblDescripcion.attributedText  = [Metodos convertHTMLToString:_poiSelected.descripcion];
        if(_poiSelected.urlImagen){
            [_imgView sd_setImageWithURL:[[NSURL alloc] initWithString:_poiSelected.urlImagen] placeholderImage:[UIImage imageNamed:@"iimageNone" ]];
        }else{
            _imgView.image = [UIImage imageNamed:@"iimageNone"];
        }
        _listImages = [PoiImagenDAO getPoiImagenesByidPoi:_poiSelected.idPoi];
        
        

        if(_listImages && _listImages.count > 0){
            //////
            NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [path stringByAppendingString:((PoiImagen *)[_listImages firstObject]).urlImagen];
            _imgViewListImages.image = [UIImage imageWithContentsOfFile:path ];
         
            UITapGestureRecognizer *tapListImages = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAlbum)];
            [self.imgViewListImages addGestureRecognizer:tapListImages];
            [_poiSelected.listImagen setByAddingObjectsFromArray:_listImages];

        }else{
            [_imgViewListImages removeFromSuperview];
        }
        
    }else{
        _imgView.image = [UIImage imageNamed:@"iimageNone"];
        [_imgViewListImages removeFromSuperview];
    }

}
-(void) openAlbum{
    AlbumViewController *album = [AlbumViewController new];
    [album setListfOfImage:_listImages];
    [self presentViewController:album animated:YES completion:nil];
    
}


- (IBAction)btnOpenMenu:(id)sender {
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
