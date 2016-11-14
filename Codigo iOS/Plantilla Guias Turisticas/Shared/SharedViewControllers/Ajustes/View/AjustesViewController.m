//
//  AjustesViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 14/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "AjustesViewController.h"
#import "LanguagePickerController.h"
#import "UtilsAppearance.h"
#import "IdiomaDAO.h"
#import "Idioma+CoreDataProperties.h"
#import "Settings.h"
#import "Reachability.h"

#import "UIViewController+MMDrawerController.h"

#import "NSBundle.h"

@interface AjustesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextField *fieldLanguage;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic, strong) LanguagePickerController *pickerController;
@property (strong, nonatomic) UIToolbar *pickerToolbar;


@property (nonatomic,strong) NSArray *listIdiomas;
@end

@implementation AjustesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPicker];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initPicker{
    //_topics = [ProceduresCategoryDAO getProceduresCategories];
    _pickerView = [[UIPickerView alloc] init];
    _pickerController = [[LanguagePickerController alloc] init];
    _pickerView.delegate = _pickerController;
    _pickerView.dataSource = _pickerController;
    _listIdiomas = [IdiomaDAO getIdiomas];
    [_pickerController setLisLanguages:_listIdiomas];
    _fieldLanguage.inputView = _pickerView;
    
    NSString *auxidioma = [[Settings sharedInstance] idioma];
    int posiIdioma = 0;
    for (posiIdioma=0; posiIdioma<_listIdiomas.count; posiIdioma++) {
        if([auxidioma isEqualToString:((Idioma *)[_listIdiomas objectAtIndex:posiIdioma]).codigoIdioma]){
            break;
        }
    }
    _fieldLanguage.text = ((Idioma *)[_listIdiomas objectAtIndex:posiIdioma]).nombreIdioma;
    
    
    [self pickerAppearance];
    [_pickerView selectRow:posiIdioma inComponent:0 animated:YES];
    //[self pickerDoneClicked];
}

-(void)pickerAppearance{
    [_pickerView setShowsSelectionIndicator:YES];
    [_pickerView removeFromSuperview];
    _pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/3)];
    [_pickerToolbar setBarStyle:UIBarStyleBlackOpaque];
    [_pickerToolbar setBarTintColor:[UtilsAppearance getPrimaryColor]];
    [_pickerToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    flexSpace.title = @"OK";
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [doneBtn setTintColor:[UIColor whiteColor]];
    [barItems addObject:doneBtn];
    
    [_pickerToolbar setItems:barItems animated:YES];
    
    [_fieldLanguage setInputAccessoryView:_pickerToolbar];
    [_pickerToolbar removeFromSuperview];
}

-(void)pickerDoneClicked{
    [_fieldLanguage resignFirstResponder];
    Idioma *idiomaAux = ((Idioma*)[_listIdiomas objectAtIndex:[_pickerView selectedRowInComponent:0]]);
    if([idiomaAux.codigoIdioma isEqualToString: [[Settings sharedInstance] idioma]]){
        
    }else{
    _fieldLanguage.text = [((Idioma*)[_listIdiomas objectAtIndex:[_pickerView selectedRowInComponent:0]]) nombreIdioma];
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:NSLocalizedString(@"ajustes_title_change_language", nil)
                                 message:NSLocalizedString(@"ajustes_descripcion_language", nil)
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"ajustes_ok_language", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                   // [self downloadParameters];
                                 Reachability* reach =    [Reachability reachabilityForInternetConnection];
                                    [reach startNotifier];
                                    NetworkStatus remoteHostStatus = [reach currentReachabilityStatus];
                                    if(remoteHostStatus == NotReachable) {
                                        NSLog(@"no");
                                        [self noInternetConnection];
                                    }
                                    else if (remoteHostStatus == ReachableViaWiFi) {
                                        Idioma * idiomaAux = ((Idioma*)[_listIdiomas objectAtIndex:[_pickerView selectedRowInComponent:0]]) ;
                                        [[Settings sharedInstance] setIdioma:idiomaAux.codigoIdioma];
                                        [[Settings sharedInstance] saveSettings];
                                        [NSBundle setLanguage:idiomaAux.codigoIdioma];
                                        [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGE_LANGUAGE" object:nil];
                                    }
                                    else if (remoteHostStatus == ReachableViaWWAN) {
                                        Idioma * idiomaAux = ((Idioma*)[_listIdiomas objectAtIndex:[_pickerView selectedRowInComponent:0]]) ;
                                        [[Settings sharedInstance] setIdioma:idiomaAux.codigoIdioma];
                                        [[Settings sharedInstance] saveSettings];
                                        [NSBundle setLanguage:idiomaAux.codigoIdioma];
                                       [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGE_LANGUAGE" object:nil];
                                    
                                    }
                                    
                                }];
    UIAlertAction* noButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"ajustes_cancel_language", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                   // [self downloadParameters];
                                }];
    
    [alert addAction:yesButton];
     [alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void) noInternetConnection{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:NSLocalizedString(@"ajustes_title_error_internet", nil)
                                 message:NSLocalizedString(@"ajustes_descripcion_error_no_internet", nil)
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"ajustes_error_ok", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                    // [self downloadParameters];
                                    [self initPicker];
                                }];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];

}
- (IBAction)openMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

@end
