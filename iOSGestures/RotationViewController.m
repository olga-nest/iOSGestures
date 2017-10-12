//
//  RotationViewController.m
//  iOSGestures
//
//  Created by Olga on 10/12/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat height = 100;
    CGFloat widht  = 100;
    
    CGRect frame = (CGRectMake(CGRectGetMidX(self.view.bounds) - widht/2, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(viewRotated:)];
    [view addGestureRecognizer:rotationRecognizer];
}

-(void)viewRotated: (UIRotationGestureRecognizer *) sender {

    static CGFloat initialRotation;
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        initialRotation = atan2f(sender.view.transform.b, sender.view.transform.a);
    }
    CGFloat newRotation = initialRotation + sender.rotation;
    sender.view.transform = CGAffineTransformMakeRotation(newRotation);
    
}


@end
