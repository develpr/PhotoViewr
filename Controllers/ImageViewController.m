//
//  ImageViewController.m
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/18/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ImageViewController

/**
  * Instance variable setup/lazy instantiation
  */

- (UIImageView *)imageView
{
    if(!_imageView)
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    return _imageView;
}

- (void) setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self setupImage];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void) setupImage
{
    if(self.imageView){
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
        
        NSData *imageData = [[NSData alloc]initWithContentsOfURL:self.imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        if(image){
            self.scrollView.contentSize = image.size;
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0,0, image.size.width, image.size.height);
        }
    }
}

- (void) viewDidLayoutSubviews
{
    CGRect scrollViewBounds = self.scrollView.bounds;
    
    CGFloat scrollAspectRatio = scrollViewBounds.size.width/scrollViewBounds.size.height;
    
    CGSize imageViewSize = self.imageView.image.size;
    CGFloat imageAspectRatio = imageViewSize.width/imageViewSize.height;
    
    if(imageAspectRatio < scrollAspectRatio){
        self.scrollView.zoomScale = scrollViewBounds.size.height/imageViewSize.height;
    }else{
        self.scrollView.zoomScale = scrollViewBounds.size.width/imageViewSize.width;
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.scrollView addSubview:self.imageView];
    self.scrollView.maximumZoomScale = 25.0;
    self.scrollView.minimumZoomScale = 0.01;
    self.scrollView.delegate = self;
    [self setupImage];
}

@end
