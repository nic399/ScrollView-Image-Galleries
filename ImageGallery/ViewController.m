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
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIImageView *imageView2;
@property (nonatomic) UIImageView *imageView3;
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

    
    
    
    
    
//    [self setUpImages];
//    [self constrainImages];
//    [self setUpImageviewTouchRecognizers];
    [self createPageControl];
}

-(void)setUpImages {
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse0"]];
    imageView1.translatesAutoresizingMaskIntoConstraints = false;
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = true;
    imageView1.userInteractionEnabled = true;
    [self.scrollView addSubview:imageView1];
    self.imageView1 = imageView1;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse1"]];
    imageView2.translatesAutoresizingMaskIntoConstraints = false;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.clipsToBounds = true;
    imageView2.userInteractionEnabled = true;
    [self.scrollView addSubview:imageView2];
    self.imageView2 = imageView2;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lighthouse2"]];
    imageView3.translatesAutoresizingMaskIntoConstraints = false;
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.clipsToBounds = true;
    imageView3. userInteractionEnabled = true;
    [self.scrollView addSubview:imageView3];
    self.imageView3 = imageView3;
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

-(void)constrainImages {
    [self.imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [self.imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    
    [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = true;
    //[self.imageView1.trailingAnchor constraintEqualToAnchor:self.imageView2.leadingAnchor].active = true;
    
    
    
    [self.imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [self.imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    
    [self.imageView2.leadingAnchor constraintEqualToAnchor:self.imageView1.trailingAnchor].active = true;

    
    
    [self.imageView3.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [self.imageView3.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [self.imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [self.imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    
    [self.imageView3.leadingAnchor constraintEqualToAnchor:self.imageView2.trailingAnchor].active = true;
    
    
    
    [self.imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = true;
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

-(void)setUpImageviewTouchRecognizers {
    UITapGestureRecognizer *img1Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDetail:)];
    [self.imageView1 addGestureRecognizer:img1Tap];
    UITapGestureRecognizer *img2Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDetail:)];
    [self.imageView2 addGestureRecognizer:img2Tap];
    UITapGestureRecognizer *img3Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDetail:)];
    [self.imageView3 addGestureRecognizer:img3Tap];
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




-(void)addTapGestureRecognizers {
    for (int i = 0; i < [self.imageViewsArr count]; i++) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageDetail:)];
        [self.imageViewsArr[i] addGestureRecognizer:tapGesture];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
