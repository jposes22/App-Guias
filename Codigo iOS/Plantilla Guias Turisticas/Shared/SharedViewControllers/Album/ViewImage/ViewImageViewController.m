//
//  ViewImageViewController.m
//  Plantilla Guias Turisticas
//
//  Created by Evelb on 20/11/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ViewImageViewController.h"

@interface ViewImageViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.delegate = self;
    self.scrollView.contentSize = self.imageView.image.size;
    _scrollView.maximumZoomScale = 2.0;

    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(doubleTap:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tapGestureRecognizer];
    self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    [self loadStyle];
    [self loadData];
}
- (void)loadData{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    path = [path stringByAppendingString:_imageShow];
    _imageView.image = [UIImage imageWithContentsOfFile:path];
}
- (void)loadStyle{
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor blackColor];
}
- (void)doubleTap:(UITapGestureRecognizer *)tap
{
    if (_scrollView.zoomScale > _scrollView.minimumZoomScale)
    {
        [_scrollView setZoomScale:_scrollView.minimumZoomScale animated:YES];
    }else {
        [_scrollView setZoomScale:_scrollView.maximumZoomScale animated:YES];
    }
    
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return self.imageView;
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
