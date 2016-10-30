//
//  ViewImage.m
//  TorresDeOeste
//
//  Created by Evelb on 24/10/16.
//  Copyright © 2016 Evelb. All rights reserved.
//

#import "ViewImage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewImage ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation ViewImage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScroll];
    [self loadStyle];
    [self loadData];
}
- (void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setZoomScale];
    [_scrollView setZoomScale:_scrollView.minimumZoomScale animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createScroll{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    _imageView.clipsToBounds = YES;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.contentSize = self.view.frame.size;
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_scrollView addSubview:_imageView];
    [self.view addSubview:_scrollView];
    
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(doubleTap:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tapGestureRecognizer];
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
#pragma mark - private methods
- (void) updateMinZoomScaleForSize:(CGSize) size{
    CGFloat withdScale = size.width / _imageView.bounds.size.width;
    
    CGFloat heightScale = size.height / _imageView.bounds.size.height;
    CGFloat minScale = MIN(heightScale, withdScale);
    
    _scrollView.minimumZoomScale = minScale;
    
    _scrollView.zoomScale = minScale;
}

- (void)setZoomScale{
    CGSize imagenViewSize = _imageView.frame.size;
    CGSize scrollViewSize = _scrollView.frame.size;
    CGFloat widthScale = scrollViewSize.width / imagenViewSize.width;
    CGFloat heightScale = scrollViewSize.height / imagenViewSize.height;
    _scrollView.minimumZoomScale = MIN(widthScale, heightScale);
    _scrollView.maximumZoomScale = 2.0;
}
#pragma mark - UIScrollView Delegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize imagenViewSize = _imageView.frame.size;
    CGSize scrollViewSize = _scrollView.frame.size;
    CGFloat verticalPadding = 0.0;
    if (imagenViewSize.height < scrollViewSize.height)
    {
        verticalPadding = (scrollViewSize.height - imagenViewSize.height) / 2;
    }
    CGFloat horizontalPadding = 0.0;
    if (imagenViewSize.width < scrollViewSize.width)
    {
        horizontalPadding = (scrollViewSize.width - imagenViewSize.width) / 2;
    }
    scrollView.contentInset = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding);
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
