//
//  SelfieViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Jose Pose on 27/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "SelfieViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface SelfieViewController ()<AVSpeechSynthesizerDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>

    @property(nonatomic,retain) AVCaptureSession *sesion;
    @property (nonatomic,retain) AVCaptureConnection *conex;


    @property (nonatomic,retain) AVCaptureVideoPreviewLayer *captureLayer;
    @property (nonatomic,retain) AVCaptureDevice *camera;

    @property (nonatomic) int retard;

    @property (nonatomic) int tipo;
    @property (nonatomic) BOOL sacarfoto;

    @property (nonatomic) BOOL fotomanual;
    @property (nonatomic,retain) AVCaptureStillImageOutput *stillImageOutput;//strong
    @property (nonatomic) float ang;

@property (weak, nonatomic) IBOutlet UIButton *bthombre ;
@property (weak, nonatomic) IBOutlet UIButton *btmujer;
@property (weak, nonatomic) IBOutlet UIImageView *imageoverlay;


@property (nonatomic,weak) IBOutlet UIView *mainview;
@property (nonatomic) AVCaptureStillImageOutput *stillimage;

@property Boolean analizando;
@property Boolean stop;
@property Boolean procesando;
@property (nonatomic) UIImage *image;
@property (nonatomic) int contador;

@property (nonatomic,retain) ALAssetsLibrary *lib;

@end

@implementation SelfieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) viewDidAppear:(BOOL)animated{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(status == AVAuthorizationStatusAuthorized) { // authorized
        _lib = [SelfieViewController defaultAssetsLibrary];
        [self inicializarCamara];
    }
    else if(status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted){ // denied
        dispatch_async( dispatch_get_main_queue(), ^{
            NSString *message = NSLocalizedString( @"My App doesn't have permission to use the camera, please change privacy settings", @"Alert message when the user has denied access to the camera" );
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"OK", @"Alert OK button" ) style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            // Provide quick access to Settings.
            UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:NSLocalizedString( @"Settings", @"Alert button to open Settings" ) style:UIAlertActionStyleDefault handler:^( UIAlertAction *action ) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }];
            [alertController addAction:settingsAction];
            [self presentViewController:alertController animated:YES completion:nil];
        });
        
    }
    else if(status == AVAuthorizationStatusNotDetermined){ // not determined
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted){ // Access has been granted ..do something
                _lib = [SelfieViewController defaultAssetsLibrary];
                [self inicializarCamara];
            } else { // Access denied ..do something
                
            }
        }];
    }
    
    
}

// Provide quick access to Settings.



- (void) inicializarCamara{
    
    
    _sesion = [[AVCaptureSession alloc] init];
    _sesion.sessionPreset = AVCaptureSessionPresetPhoto;
    
    
    _captureLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_sesion];
    [_captureLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    
    _captureLayer.frame = self.mainview.bounds;
    [self.mainview.layer addSublayer:_captureLayer];
    
    
    
    UIView *v = [self mainview];
    CALayer *vlayer = [v layer];
    [vlayer setMasksToBounds:YES];
    
    CGRect b = [v bounds];
    [_captureLayer setFrame:b];
    
    
    
    
    NSArray *dev = [AVCaptureDevice devices];
    
    for (AVCaptureDevice *dev2 in dev){
        
        if ([dev2 hasMediaType:AVMediaTypeVideo]){
            
            if ([dev2 position] == AVCaptureDevicePositionFront) {
                _camera = dev2;
            }
            
        }
        
    }
    
    
    AVCaptureDeviceInput *entrada = [AVCaptureDeviceInput deviceInputWithDevice:_camera error:nil];
    [_sesion addInput:entrada];
    
    
    dispatch_queue_t q = dispatch_queue_create("myQueue", NULL);
    dispatch_queue_t q2 = dispatch_queue_create("myQueue2", NULL);
    
    AVCaptureVideoDataOutput *salida = [[AVCaptureVideoDataOutput alloc] init];
    
    
    
    [_sesion addOutput:salida];
    
    
    _conex = [salida connectionWithMediaType:AVMediaTypeVideo];
    
    AVCaptureVideoOrientation ori = AVCaptureVideoOrientationPortrait;
    [_conex setVideoOrientation:UIDeviceOrientationPortrait];
    
    [salida setSampleBufferDelegate:self queue:q];
    
    salida.videoSettings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    
    
    AVCaptureVideoOrientation ori2 = AVCaptureVideoOrientationPortrait;
    [_conex setVideoOrientation:ori2];
    
    
    [_sesion startRunning];
    
    
    
}




-(void) captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
    
    
    
        
        
        float vmax = 50;
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        //if((retard > 50) && (v > slider.progress && slider.progress > 0.0)){
        if( self.procesando == false && _sacarfoto == YES){
            
            self.procesando = true;
            
            CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
            // Lock the base address of the pixel buffer
            CVPixelBufferLockBaseAddress(imageBuffer, 0);
            
            // Get the number of bytes per row for the pixel buffer
            void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
            
            // Get the number of bytes per row for the pixel buffer
            size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
            // Get the pixel buffer width and height
            size_t width = CVPixelBufferGetWidth(imageBuffer);
            size_t height = CVPixelBufferGetHeight(imageBuffer);
            
            // Create a device-dependent RGB color space
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            
            // Create a bitmap graphics context with the sample buffer data
            CGContextRef context1 = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                          bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
            
            // Create a Quartz image from the pixel data in the bitmap graphics context
            CGImageRef quartzImage = CGBitmapContextCreateImage(context1);
            // Unlock the pixel buffer
            CVPixelBufferUnlockBaseAddress(imageBuffer,0);
            
            // Free up the context and color space
            CGContextRelease(context1);
            CGColorSpaceRelease(colorSpace);
            
            // Create an image object from the Quartz image
            //I modified this line: [UIImage imageWithCGImage:quartzImage]; to the following to correct the orientation:
            
            self.image =  [UIImage imageWithCGImage:quartzImage];
            
            [self guardar:self.image];
            
            CGImageRelease(quartzImage);
            
            
            _sacarfoto = NO;
            self.procesando = false;
            
        }
        
        
    
    
}

- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{

        
        
        NSLog(@"imageFromSampleBuffer: called");
        // Get a CMSampleBuffer's Core Video image buffer for the media data
        CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
        // Lock the base address of the pixel buffer
        CVPixelBufferLockBaseAddress(imageBuffer, 0);
        
        // Get the number of bytes per row for the pixel buffer
        void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
        
        // Get the number of bytes per row for the pixel buffer
        size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
        // Get the pixel buffer width and height
        size_t width = CVPixelBufferGetWidth(imageBuffer);
        size_t height = CVPixelBufferGetHeight(imageBuffer);
        
        
        
        // Create a device-dependent RGB color space
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        
        
        // Create a bitmap graphics context with the sample buffer data
        CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                     bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        
        
        
        //CGContextRotateCTM(context, (90*M_PI)/180);
        
        
        
        // Create a Quartz image from the pixel data in the bitmap graphics context
        CGImageRef quartzImage = CGBitmapContextCreateImage(context);
        
        
        // Unlock the pixel buffer
        CVPixelBufferUnlockBaseAddress(imageBuffer,0);
        
        
        // Free up the context and color space
        UIGraphicsEndImageContext();
        
        //CGContextRelease(context);
        CGColorSpaceRelease(colorSpace);
        
        
        // Create an image object from the Quartz image
        UIImage *imageres = [UIImage imageWithCGImage:quartzImage];
        
        
        // Release the Quartz image
        CGImageRelease(quartzImage);
        
        
        
        return imageres;
 
}


-(void)guardar:(UIImage*)image{
    
    
    
    UIImage *overlayImage  = [UIImage imageNamed:@"hombre_fondo"]; //foverlayImage image
    
    if (_tipo == 1) overlayImage  = [UIImage imageNamed:@"mujer_fondo.png"]; //foverlayImage image
    
    
    CGSize newSize = image.size;
    UIGraphicsBeginImageContext( newSize );
    
    [image drawInRect:CGRectMake(50,-155,newSize.width*0.96,newSize.height*0.96)];
    
    // Apply supplied opacity if applicable
    [overlayImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:1];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    
    
    
    
    
    
    CGImageRef cgim = [newImage CGImage];
    
    [_lib writeImageToSavedPhotosAlbum: cgim orientation:image.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
        if (assetURL){
            
            [_lib assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                
                [_lib enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                    
                    if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@"A_Lanzada"]){
                        
                        [group addAsset:asset];
                        *stop = YES;
                        NSLog(@"Añadida imagen");
                        
                        
                    }
                    if (!group){
                        
                        [_lib addAssetsGroupAlbumWithName:@"Torres_Oeste" resultBlock:^(ALAssetsGroup *group) {
                            
                            [group addAsset:asset];
                        } failureBlock:^(NSError *error) {
                            NSLog(@"Error add asset");
                        }];
                        
                        
                        
                        
                    }
                    
                } failureBlock:^(NSError *error) {
                    NSLog(@"Error nivel 3");
                }];
                
                
                
            } failureBlock:^(NSError *error) {
                NSLog(@"%@", error);
            }];
            
            
            
            
        }
        
    }];
    
    
}


-(IBAction)foto:(id)sender{
    
    _sacarfoto = YES;
    
    
}

-(IBAction)cambiartipo:(id)sender{
    
    _tipo = 0;
    
    [_bthombre setImage:[UIImage imageNamed:@"hombreon.png"] forState:UIControlStateNormal];
    [_bthombre setImage:[UIImage imageNamed:@"hombreon.png"] forState:UIControlStateHighlighted];
    [_bthombre setImage:[UIImage imageNamed:@"hombreon.png"] forState:UIControlStateSelected];
    
    [_btmujer setImage:[UIImage imageNamed:@"mujeroff.jpg"] forState:UIControlStateNormal];
    [_btmujer setImage:[UIImage imageNamed:@"mujeroff.jpg"] forState:UIControlStateHighlighted];
    [_btmujer setImage:[UIImage imageNamed:@"mujeroff.jpg"] forState:UIControlStateSelected];
    
    [_imageoverlay setImage:[UIImage imageNamed:@"hombre_grande.png"]];
    
    
    
}

-(IBAction)cambiartipo2:(id)sender{
    
    _tipo = 1;
    
    [_bthombre setImage:[UIImage imageNamed:@"hombreoff.jpg"] forState:UIControlStateNormal];
    [_bthombre setImage:[UIImage imageNamed:@"hombreoff.jpg"] forState:UIControlStateHighlighted];
    [_bthombre setImage:[UIImage imageNamed:@"hombreoff.jpg"] forState:UIControlStateSelected];
    
    [_btmujer setImage:[UIImage imageNamed:@"mujeron.png"] forState:UIControlStateNormal];
    [_btmujer setImage:[UIImage imageNamed:@"mujeron.png"] forState:UIControlStateHighlighted];
    [_btmujer setImage:[UIImage imageNamed:@"mujeron.png"] forState:UIControlStateSelected];
    
    [_imageoverlay setImage:[UIImage imageNamed:@"mujer_grande.png"]];
    
}





-(IBAction)salir:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
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
