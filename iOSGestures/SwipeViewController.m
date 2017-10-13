//
//  SwipeViewController.m
//  iOSGestures
//
//  Created by Olga on 10/12/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) UIView *brownView;
@property (nonatomic) UIView *whiteView;
@property (nonatomic) BOOL isOpen;
@property (nonatomic) UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat widht;


@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGFloat height = 50;
    CGFloat widht  = 300;
    
    CGRect frame = (CGRectMake(CGRectGetMidX(self.view.bounds) - widht/2, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *brownView = [[UIView alloc]initWithFrame:frame];
    brownView.backgroundColor = [UIColor brownColor];
    brownView.clipsToBounds = YES;
    [self.view addSubview:brownView];
    
    CGRect whiteViewFrame = CGRectMake(0, 0, brownView.frame.size.width, brownView.frame.size.height);
    
    UIView *whiteView = [[UIView alloc]initWithFrame:whiteViewFrame];
    whiteView.backgroundColor = [UIColor whiteColor];
    self.isOpen = NO;
    //Fix me!
    [brownView addSubview:whiteView];
    
    UISwipeGestureRecognizer *swipeRightRecognizer;
    
    swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(viewSwiped:)];
    [whiteView addGestureRecognizer:swipeRightRecognizer];
    [swipeRightRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer;
    
    swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(viewSwiped:)];
    [whiteView addGestureRecognizer:swipeLeftRecognizer];
    [swipeLeftRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];

    
}

-(void)viewSwiped: (UISwipeGestureRecognizer *) sender {
    NSLog(@"Swipe!..");
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft: {
            if (self.isOpen == NO) {
                sender.view.frame = CGRectMake(sender.view.frame.origin.x-70, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
                self.isOpen = YES;
            }
        } break;
        case UISwipeGestureRecognizerDirectionRight: {
            if (self.isOpen == YES) {
            sender.view.frame = CGRectMake(sender.view.frame.origin.x+70, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
            self.isOpen = NO;
        } break;
            
        default:
            break;
    }
    
    }

}

@end


