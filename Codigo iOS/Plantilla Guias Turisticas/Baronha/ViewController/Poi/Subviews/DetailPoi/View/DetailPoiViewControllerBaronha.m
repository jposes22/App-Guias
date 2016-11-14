//
//  DetailPoiViewController.m
//  TorresDeOeste
//
//  Created by Jose Pose on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "DetailPoiViewControllerBaronha.h"
#import "UIViewController+MMDrawerController.h"
#import "PoiDAO.h"
#import "Poi+CoreDataProperties.h"
#import "Metodos.h"
#import "UtilsAppearance.h"
#import "StylesBaronha.h"
#import "PoiImagen+CoreDataProperties.h"
#import "AlbumViewController.h"

@interface DetailPoiViewControllerBaronha ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewList;



@property (nonatomic, strong) Poi *poiDetail;
@end

@implementation DetailPoiViewControllerBaronha

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self loadStyle];
}




-(void) loadData{
    [_imgViewDetail removeFromSuperview];
    NSArray *listPois =  [PoiDAO getPoiByCategory:_categoryPoi];
    if(listPois && listPois.count > 0){
        _poiDetail = listPois.firstObject;
        _lblTitle.attributedText = [Metodos convertHTMLToString:_poiDetail.titulo];
        _lblDescription.attributedText = [Metodos convertHTMLToString:_poiDetail.descripcion];
        
        if(_poiDetail.listImagen && _poiDetail.listImagen.count > 0){
            NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [path stringByAppendingString:((PoiImagen *)[_poiDetail.listImagen anyObject]).urlImagen];
            _imageViewList.image = [UIImage imageWithContentsOfFile:path ];
            
            UITapGestureRecognizer *tapListImages = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAlbum)];
            [_imageViewList addGestureRecognizer:tapListImages];

        }else{
            [_imgViewDetail removeFromSuperview];
        }

    }else{
        [_imgViewDetail removeFromSuperview];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadStyle{
    //[StylesBaronha setStyleTitle:_lblTitle];
}
-(void)loadNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Lugares de Interés"];
}
- (IBAction)btnOpenMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void) openAlbum{
    AlbumViewController *album = [AlbumViewController new];
    [album setListfOfImage:[_poiDetail.listImagen allObjects]];
    [self presentViewController:album animated:YES completion:nil];
    
}

@end
