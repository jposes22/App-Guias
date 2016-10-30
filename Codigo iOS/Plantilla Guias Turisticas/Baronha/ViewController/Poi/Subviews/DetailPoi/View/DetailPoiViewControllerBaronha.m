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

@interface DetailPoiViewControllerBaronha ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;


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
        _lblTitle.text = _poiDetail.titulo;
        _lblDescription.attributedText = [Metodos convertHTMLToString:_poiDetail.descripcion];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadStyle{
    [StylesBaronha setStyleTitle:_lblTitle];
}
-(void)loadNavigationBar{
    [UtilsAppearance setStyleNavigationBar:self.navigationController.navigationBar withTitle:@"Lugares de Interés"];
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
