//
//  MenuViewController.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "RightViewController.h"
#import "AjustesViewController.h"
#import "Constants.h"
#import "SelfieNavigationController.h"

@interface MenuViewController ()<RightMenuComunication>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDrawer];
    [self setupRightDrawer];
    [self loadGesturesAllowed];
    [self loadNotificationCenter];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeViewController) name:@"CHANGE_LANGUAGE" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    

}
-(void) setupDrawer {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"HomeNC"];
    [self setCenterViewController:vc];
}

-(void) setupRightDrawer{
     RightViewController *mainMenu = [[RightViewController alloc] initWithNibName:@"RightViewController" bundle:nil];
    mainMenu.delegateRightMenu = self;
     [self setRightDrawerViewController:mainMenu];
     [self setMaximumRightDrawerWidth:[UIScreen mainScreen].bounds.size.width/2 animated: true completion: nil];
}

-(void) loadGesturesAllowed{
    // Customize Back Button and gestures back
    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeBezelPanningCenterView;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView | MMCloseDrawerGestureModeTapCenterView | MMCloseDrawerGestureModePanningDrawerView;
}
#pragma mark - Change menus or centerViewControllers
-(void) changeCenterViewController:(SideDrawerMenuItem) sideDrawerMenuSelected toogle:(BOOL) isToogle{
    UIViewController *controllerLoader;
    UIStoryboard *sb;
    
    switch (sideDrawerMenuSelected) {
        case SideDrawerMenuItemHome:
            sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"HomeNC"];
            break;
        case SideDrawerMenuItemGuia:
            sb = [UIStoryboard storyboardWithName:@"Guias" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"GuiasNC"];
            break;
        case SideDrawerMenuItemRomeria:
            sb = [UIStoryboard storyboardWithName:@"MainRomeria" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"RomeriaNC"];
            break;
        case SideDrawerMenuItemPoi:
            sb = [UIStoryboard storyboardWithName:@"Poi" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"PoiNC"];
            break;
            
        case SideDrawerMenuItemReferencias:
             sb = [UIStoryboard storyboardWithName:@"Referencias" bundle:nil];
             controllerLoader = [sb instantiateViewControllerWithIdentifier:@"ReferenciasNC"];
            break;
        case SideDrawerMenuItemCopyright:
            sb = [UIStoryboard storyboardWithName:@"Copyright" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"CopyrightNC"];
            break;
        case SideDrawerMenuItemComoLlegar:
            sb = [UIStoryboard storyboardWithName:@"ComoLlegar" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"ComoLlegarNC"];
            break;
        case SideDrawerMenuCreditos:
            sb = [UIStoryboard storyboardWithName:@"Creditos" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"CreditosNC"];
            break;
        case SideDrawerMenuSelfie:
            sb = [UIStoryboard storyboardWithName:@"Selfie" bundle:nil];
            controllerLoader = [sb instantiateViewControllerWithIdentifier:@"SelfieNC"];
            break;

        case SideDrawerMenuItemAjustes:
            controllerLoader = [[AjustesViewController alloc] initWithNibName:@"AjustesViewController" bundle:nil];
            
            break;
            /*
        case SideDrawerMenuItemAdherencia:
            controllerLoader = [[AdherenciaViewController alloc] initWithNibName:@"AdherenciaViewController" bundle:nil];
            break;*/
        default:
            break;
    }
    if(controllerLoader){
        [self setCenterViewController:controllerLoader];
        if(isToogle){
            [self toggleDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
                [self setCenterViewController:controllerLoader];
                [self supportedInterfaceOrientations];
            }];
        }
        
    }
}
-(BOOL)shouldAutorotate{
    return NO;
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if([self.centerViewController isKindOfClass:[SelfieNavigationController class]]){
        return UIInterfaceOrientationMaskPortrait;
    }
    return UIInterfaceOrientationMaskLandscape;
}
-(void) changeCenterViewControllerWithMenu:(SideDrawerMenuItem)sideDrawerMenuSelected  {
    [self changeCenterViewController: sideDrawerMenuSelected toogle:YES];
}
-(void) changeCenterViewControllerWithNotification:(NSNotification*)sideDrawerMenuSelected{
    if([sideDrawerMenuSelected.name isEqualToString:kNOTIFICATION_GO_TO]){
        [self changeCenterViewController: [sideDrawerMenuSelected.object integerValue] toogle:NO];
    }
}
-(void) loadNotificationCenter{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCenterViewControllerWithNotification:) name:kNOTIFICATION_GO_TO object:nil];
    
}

-(void) removeViewController{
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
