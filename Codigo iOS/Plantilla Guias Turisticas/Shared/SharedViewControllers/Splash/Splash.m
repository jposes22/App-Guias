//
//  Splash.m
//  TorresDeOeste
//
//  Created by Evelb on 8/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "Splash.h"
#import "MenuViewController.h"
#import "Settings.h"
#import "Constants.h"
#import "RemoteConstants.h"
#import "SelectIdiomaViewController.h"
#import "ParametrosRepositorio.h"
#import "AppDelegate.h"

//Remotes
#import "RemoteParametros.h"
#import "RemoteIdioma.h"
#import "RemoteMenu.h"
#import "RemotePoi.h"
#import "RemoteGuiaSaberMas.h"
#import "RemoteGuia.h"
#import "RemoteGuiaDetalle.h"
#import "RemoteGuiaSaberMasDetalle.h"

@interface Splash ()<CommunicationParametros, CommunicationIdioma, CommunicationMenu, CommunicationPoi, CommunicationGuiaSaberMas, CommunicationGuia, CommunicationGuiaDetalle, CommunicationGuiaSaberMasDetalle>
@property (weak, nonatomic) IBOutlet UIImageView *imageViewSplash;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic) float progresValue;
@property (nonatomic) NSInteger downloadWithoutErrorParametos;
@property (nonatomic) NSInteger downloadWithoutErrorIdioma;
@property (nonatomic) NSInteger downloadWithoutErrorMenu;
@property (nonatomic) NSInteger downloadWithoutErrorPoi;
@property (nonatomic) NSInteger downloadWithoutErrorGuia;
@property (nonatomic) NSInteger downloadWithoutErrorGuiaDetalle;
@property (nonatomic) NSInteger downloadWithoutErrorGuiaSaberMas;
@property (nonatomic) NSInteger downloadWithoutErrorGuiaSaberMasDetalle;






@end

@implementation Splash

- (void)viewDidLoad {
    [super viewDidLoad];
    //init variables
    [self resetDownloadVar];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(idiomaElegido:) name:@"NOTIFICATION_IDIOMA_ELEGIDO" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteAllData) name:@"CHANGE_LANGUAGE" object:nil];
    
    if(![[Settings sharedInstance] wasStaredAppBefore]){
        _progressView.hidden = NO;
        [self insertParametros];
    }
    [self downloadParameters];
}

-(void) resetDownloadVar{
    _downloadWithoutErrorParametos=0;
    _downloadWithoutErrorIdioma =0;
    _downloadWithoutErrorMenu = 0;
    _downloadWithoutErrorPoi = 0;
    _downloadWithoutErrorGuia = 0;
    _downloadWithoutErrorGuiaDetalle = 0;
    _downloadWithoutErrorGuiaSaberMas = 0;
    _downloadWithoutErrorGuiaSaberMasDetalle = 0;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

   
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([[Settings sharedInstance] wasStaredAppBefore]){
         [self loadMenuAndHomeViewController];
    }

}


- (void) insertParametros{
    [ParametrosRepositorio saveParametersInBD];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadMenuAndHomeViewController{
    if(![[Settings sharedInstance] wasStaredAppBefore]){
        [[Settings sharedInstance] setWasStaredAppBefore:YES];
        [[Settings sharedInstance] saveSettings];
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        MenuViewController * menu = [MenuViewController new];
        [self presentViewController:menu animated:NO completion:nil];
    }];

}
//Descargamos los idiomas disponibles
-(void)downloadIdioma{
    RemoteIdioma * remoteIdioma = [RemoteIdioma new];
    remoteIdioma.delegateIdioma = self;
    [remoteIdioma getIdiomas];
}

-(void)downloadParameters{
    RemoteParametros *remoteParametro = [RemoteParametros new];
    remoteParametro.delegateParametros = self;
    [remoteParametro getParametros];
}
-(void)downloadMenu{
    RemoteMenu * remoteMenu = [RemoteMenu new];
    remoteMenu.delegateMenu = self;
    [remoteMenu getMenu];
    
}
-(void)downloadPoi{
    RemotePoi * remotePoi = [RemotePoi new];
    remotePoi.delegatePoi = self;
    [remotePoi getPoi];
}
-(void)downloadGuia{
    RemoteGuia * remoteGuia = [RemoteGuia new];
    remoteGuia.delegateGuia = self;
    [remoteGuia getGuia];
    
}
-(void)downloadGuiaDetalle{
    RemoteGuiaDetalle * remoteGuiaDetalle = [RemoteGuiaDetalle new];
    remoteGuiaDetalle.delegateGuiaDetalle = self;
    [remoteGuiaDetalle getGuiasDetalle];
    
}
-(void)downloadGuiaSaberMas{
    RemoteGuiaSaberMas * remoteGuiaSaberMas = [RemoteGuiaSaberMas new];
    remoteGuiaSaberMas.delegateGuiaSaberMas = self;
    [remoteGuiaSaberMas getGuiaSaberMas];
    
}
-(void)downloadGuiaSaberMasDetalle{
    RemoteGuiaSaberMasDetalle * remoteGuiaSaberMasDetalle = [RemoteGuiaSaberMasDetalle new];
    remoteGuiaSaberMasDetalle.delegateGuiaSaberMasDetalle = self;
    [remoteGuiaSaberMasDetalle getGuiaSaberMasDetalle];
    
}
-(void)downloadData{
    [self downloadMenu];
    [self downloadPoi];
    [self downloadGuia];
    [self downloadGuiaDetalle];
    [self downloadGuiaSaberMas];
    [self downloadGuiaSaberMasDetalle];
    
    
    
}
-(void)increaseProgressValue{
    
    //this var solve total bar charge vs number of services consult in server
    //if the incrementValue is more than 0.98 (we use 0.98 because 1%3 is 0.99) the bar was charged
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _progressView.hidden = NO;
    float incrementValue = 1.0/k_NUMBER_DOWNLOADS_CHARGE;
    _progresValue = _progresValue + incrementValue;
    [_progressView setProgress:_progresValue animated:YES];
    }];
}

#pragma mark - Communication Parametros

-(void)communicationUpdateParametros:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            [self downloadIdioma];
            self.downloadWithoutErrorParametos = 1;
            break;
        case kDAO_RESPONSE_FAIL:
            self.downloadWithoutErrorParametos = 2;
            [self showAlertViewRetry];
            //show error
            break;
        case kDAO_RESPONSE_TIMEOUT:
            self.downloadWithoutErrorParametos = 2;
            [self showAlertViewRetry];
            break;
            //show error
        default:
            self.downloadWithoutErrorParametos = 2;
            break;
    }
    

}
#pragma mark - Communication Idioma

-(void)communicationUpdateIdiomas:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            self.downloadWithoutErrorIdioma = 1;
            break;
        case kDAO_RESPONSE_FAIL:
            self.downloadWithoutErrorIdioma = 2;
            //show error
            break;
        case kDAO_RESPONSE_TIMEOUT:
            self.downloadWithoutErrorIdioma = 2;
            break;
            //show error
        default:
            self.downloadWithoutErrorIdioma = 2;
            break;
    }
    if(![[Settings sharedInstance] wasStaredAppBefore] && [[Settings sharedInstance] idioma] == nil && self.downloadWithoutErrorIdioma){
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self performSegueWithIdentifier:@"showIdiomas" sender:nil];
        }];
    }else if([[Settings sharedInstance] wasStaredAppBefore] && [[Settings sharedInstance] idioma] == nil && !self.downloadWithoutErrorIdioma){
        [self showAlertViewRetry];
    }else{
         [self downloadData];
    }
}
#pragma mark - Communication Menu
-(void)communicationUpdateMenu:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
            [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIFICATION_UPDATE_MENU object:nil];
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            self.downloadWithoutErrorMenu = 1;
            [self increaseProgressValue];

            break;
        case kDAO_RESPONSE_FAIL:
            self.downloadWithoutErrorMenu = 2;
            //show error
            break;
        case kDAO_RESPONSE_TIMEOUT:
            self.downloadWithoutErrorMenu = 2;
            break;
            //show error
        default:
            self.downloadWithoutErrorMenu = 2;
            break;
    }
    
    [self firstDownloadOk];

}
#pragma  mark - communicationPoi
-(void)communicationUpdatePoi:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            self.downloadWithoutErrorPoi = 1;
            [self increaseProgressValue];
            break;
        case kDAO_RESPONSE_FAIL:
            self.downloadWithoutErrorPoi = 2;
            break;
        case kDAO_RESPONSE_TIMEOUT:
            self.downloadWithoutErrorPoi = 2;
            break;
            //show error
        default:
            self.downloadWithoutErrorPoi = 2;
            break;
    }
    [self firstDownloadOk];

}
#pragma  mark - communicationGuia

-(void)communicationUpdateGuia:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
           
            _downloadWithoutErrorGuia = 1;
            [self increaseProgressValue];

            break;
        case kDAO_RESPONSE_FAIL:
            NSLog(@"communicationUpdateGuia - PArseo " );
             _downloadWithoutErrorGuia = 2;
            //show error
            break;
        case kDAO_RESPONSE_TIMEOUT:
            _downloadWithoutErrorGuia = 2;
            NSLog(@"communicationUpdateGuia - timeout " );

            break;
            //show error
            
        default:
            _downloadWithoutErrorGuia = 2;
            break;
    }
        [self firstDownloadOk];
}
#pragma  mark - communicationGuiaDetalle
-(void)communicationUpdateGuiaDetalle:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            
            _downloadWithoutErrorGuiaDetalle = 1;
            [self increaseProgressValue];

            break;
        case kDAO_RESPONSE_FAIL:
            //show error
            NSLog(@"communicationUpdateGuiaDetalle - PArseo " );
            _downloadWithoutErrorGuiaDetalle = 2;
            break;
        case kDAO_RESPONSE_TIMEOUT:
            NSLog(@"communicationUpdateGuiaDetalle - timeout " );
            _downloadWithoutErrorGuiaDetalle = 2;
            break;
            //show error
        default:
            _downloadWithoutErrorGuiaDetalle = 2;
            break;
    }
        [self firstDownloadOk];

}
-(void)communicationUpdateGuiaSaberMas:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
           
            _downloadWithoutErrorGuiaSaberMas = 1;
            [self increaseProgressValue];
            
            break;
        case kDAO_RESPONSE_FAIL:
            NSLog(@"communicationUpdateGuiaSaberMas - PArseo " );
            //show error
            _downloadWithoutErrorGuiaSaberMas = 2;
            break;
        case kDAO_RESPONSE_TIMEOUT:
            NSLog(@"communicationUpdateGuiaSaberMas - timeout " );
            _downloadWithoutErrorGuiaSaberMas = 2;
            break;
            
            //show error
        default:
            _downloadWithoutErrorGuiaSaberMas = 2;
            break;
            
    }
    [self firstDownloadOk];

}
-(void)communicationUpdateGuiaSaberMasDetalle:(NSInteger)sended{
    switch (sended) {
        case kDAO_RESPONSE_OK_WITH_DATA:
        case kDAO_RESPONSE_OK_WITHOUT_DATA:
            self.downloadWithoutErrorGuiaSaberMasDetalle = 1;
            [self increaseProgressValue];

            break;
        case kDAO_RESPONSE_FAIL:
            self.downloadWithoutErrorGuiaSaberMasDetalle = 2;
            NSLog(@"communicationUpdateGuiaSaberMasDetalle - PArseo " );
                   break;
        case kDAO_RESPONSE_TIMEOUT:
            self.downloadWithoutErrorGuiaSaberMasDetalle = 2;
            NSLog(@"communicationUpdateGuiaSaberMasDetalle - Timeout " );
            break;
            //show error
        default:
            self.downloadWithoutErrorGuiaSaberMasDetalle = 2;
            break;
            
    }
    [self firstDownloadOk];


}
-(void) showAlertViewRetry{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:NSLocalizedString(@"error_title_first_time", nil)
                                 message:NSLocalizedString(@"error_description_first_time", nil)
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"error_button_first_time", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    [self resetDownloadVar];
                                    [self downloadParameters];
                                }];
    
       [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma makr - Selectors
-(void)idiomaElegido:(NSNotification *)notification{
    if([notification.name isEqualToString:@"NOTIFICATION_IDIOMA_ELEGIDO"]){
        [self downloadData];
    }
}

#pragma mark - Primera descarga ok
-(void)firstDownloadOk{
    if(![[Settings sharedInstance] wasStaredAppBefore]){
        if(self.downloadWithoutErrorGuia == 1 && _downloadWithoutErrorGuiaDetalle == 1 && _downloadWithoutErrorGuiaSaberMas == 1 && _downloadWithoutErrorGuiaSaberMasDetalle ==1 && self.downloadWithoutErrorPoi == 1 && self.downloadWithoutErrorMenu == 1 && self.downloadWithoutErrorIdioma == 1 && self.downloadWithoutErrorParametos == 1){
            [self loadMenuAndHomeViewController];
            [[Settings sharedInstance] setWasStaredAppBefore: YES];
            [[Settings sharedInstance] saveSettings];
        }else{
            NSLog(@"Error en la descarga: erorrEnguia %ld, error en Poi : %ld, error en Menu %ld, error en idioma : %ld, error en parametros: %ld", (long)_downloadWithoutErrorGuia, (long)_downloadWithoutErrorPoi, (long)_downloadWithoutErrorMenu, (long)_downloadWithoutErrorIdioma, (long)_downloadWithoutErrorParametos);
            //show error
            //
            if(self.downloadWithoutErrorGuia !=0 && _downloadWithoutErrorGuiaDetalle != 0 && _downloadWithoutErrorGuiaSaberMas != 0 && _downloadWithoutErrorGuiaSaberMasDetalle !=0 &&  self.downloadWithoutErrorPoi != 0 && self.downloadWithoutErrorMenu != 0 && self.downloadWithoutErrorIdioma != 0 && self.downloadWithoutErrorParametos != 0){
                [self showAlertViewRetry];
            
            }
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
-(void) deleteAllData{
   id appDelegte=  [[UIApplication sharedApplication] delegate];
    NSArray *listClasses = [[NSArray alloc] initWithObjects:@"Poi",@"Menu",@"PoiImagen",@"Guia",@"GuiaDetalle",@"GuiaDetalleImagen",@"GuiaSaberMas",@"GuiaSaberMasDetalle",@"GuiaSaberMasDetalleImagen", nil];
    for (NSString *keyEntity in listClasses) {
        [appDelegte deleteAllEntities:keyEntity];
    }
    
    [[Settings sharedInstance] resetSettings];
    [self resetDownloadVar];
    _downloadWithoutErrorParametos=1;
    _downloadWithoutErrorIdioma =1;
    //TODO: remove context elements
    _progresValue = 0;
     //[_progressView setProgress:0 animated:YES];
   // _progressView.hidden = NO;
    [self downloadData];
}


@end
