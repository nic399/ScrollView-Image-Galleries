//
//  DetailViewController.m
//  ImageGallery
//
//  Created by Nicholas Fung on 2017-10-16.
//  Copyright © 2017 Nicholas Fung. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *detailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    detailImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.scrollView addSubview:detailImageView];
    [detailImageView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = true;
    [detailImageView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = true;
    [detailImageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = true;
    [detailImageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = true;

    self.scrollView.minimumZoomScale = 0.25;
    self.scrollView.maximumZoomScale = 4.0;
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.scrollView.subviews.firstObject;
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
