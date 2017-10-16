//
//  ViewController.m
//  ImageGallery
//
//  Created by Nicholas Fung on 2017-10-16.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    imageView1.translatesAutoresizingMaskIntoConstraints = false;
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.clipsToBounds = true;
    [self.scrollView addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    imageView2.translatesAutoresizingMaskIntoConstraints = false;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.clipsToBounds = true;
    [self.scrollView addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    imageView3.translatesAutoresizingMaskIntoConstraints = false;
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.clipsToBounds = true;
    [self.scrollView addSubview:imageView3];
    
    [imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    
    [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = true;
    [imageView1.trailingAnchor constraintEqualToAnchor:imageView2.leadingAnchor].active = true;
    
    
    [imageView2.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [imageView2.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;

    [imageView2.trailingAnchor constraintEqualToAnchor:imageView3.leadingAnchor].active = true;

    [imageView3.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = true;
    [imageView3.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = true;
    
    [imageView3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [imageView3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;
    
    [imageView3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = true;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
