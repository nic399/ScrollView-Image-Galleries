//
//  ViewController.m
//  ImageGallery
//
//  Created by Nicholas Fung on 2017-10-16.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) NSArray <NSString *> *imageNamesArr;
@property (nonatomic) NSArray <UIImageView *> *imageViewsArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createImageViews];
    [self constrainImageViews];
    [self addTapGestureRecognizers];
    [self createPageControl];
}

-(void)createImageViews {
    NSMutableArray <NSString *> *imageNamesArr = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        [imageNamesArr addObject:[NSString stringWithFormat:@"lighthouse%d", i]];
    }
    self.imageNamesArr = [imageNamesArr copy];
    
    NSMutableArray <UIImageView *> *imageViewsArr = [NSMutableArray new];
    for (int i = 0; i < [self.imageNamesArr count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageNamesArr[i]]];
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = true;
        imageView.userInteractionEnabled = true;
        [self.scrollView addSubview:imageView];
        [imageViewsArr addObject:imageView];
    }
    self.imageViewsArr = [imageViewsArr copy];
}

-(void)constrainImageViews {
    [self.imageViewsArr[0].heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [self.imageViewsArr[0].widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    [self.imageViewsArr[0].topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [self.imageViewsArr[0].bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    [self.imageViewsArr[0].leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = true;
    
    for (int i = 1; i < [self.imageViewsArr count]; i++) {
        [self.imageViewsArr[i].heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
        [self.imageViewsArr[i].widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
        [self.imageViewsArr[i].topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
        [self.imageViewsArr[i].bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
        [self.imageViewsArr[i].leadingAnchor constraintEqualToAnchor:self.imageViewsArr[i-1].trailingAnchor].active = true;
    }
    
    [[self.imageViewsArr lastObject].trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = true;
}

-(void)addTapGestureRecognizers {
    for (int i = 0; i < [self.imageViewsArr count]; i++) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDetail:)];
        [self.imageViewsArr[i] addGestureRecognizer:tapGesture];
    }
}

-(void)imageDetail: (UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"pushToDetail" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITapGestureRecognizer *)sender {
    DetailViewController *destination = segue.destinationViewController;
    UIImageView *sourceImage = (UIImageView *) sender.view;
    destination.detailImage = sourceImage.image;
}

- (void)createPageControl {
    CGFloat pageControlHeight = 20.0;
    CGRect frame = CGRectMake(0.0, self.view.frame.size.height - pageControlHeight, self.view.frame.size.width, pageControlHeight);
    self.pageControl = [[UIPageControl alloc] initWithFrame:frame];
    [self.view addSubview:self.pageControl];
    self.pageControl.layer.zPosition = 2;
    self.pageControl.numberOfPages = [self.imageViewsArr count];
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.alpha = 0.5;
    [self.pageControl addTarget:self
                         action:@selector(pageTapped:)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void)updatePageControl {
    CGFloat width = self.view.frame.size.width;
    CGFloat xOffset = self.scrollView.contentOffset.x;
    NSInteger pageNumber = xOffset / width;
    self.pageControl.currentPage = pageNumber;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updatePageControl];
}

- (void)pageTapped:(UIPageControl *)sender {
    
}

@end
