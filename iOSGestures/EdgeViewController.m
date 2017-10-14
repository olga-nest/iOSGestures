//
//  EdgeViewController.m
//  iOSGestures
//
//  Created by Olga on 10/12/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@property (nonatomic) BOOL isOpen;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat widht;
@property UIScreenEdgePanGestureRecognizer *edgeRecognizer;
@property UIPanGestureRecognizer *panRecognizer;
@property UIView *myView;
@property CGRect myFrame;
@property (nonatomic) CGFloat originalEdgeX;
@property (nonatomic) CGFloat newEdgeX;
@property (nonatomic) float x_orig;
@property (nonatomic) CGPoint rightCenter;
@property (nonatomic) CGPoint leftCenter;



@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat height = 300;
    CGFloat widht  = 300;
    _height = height;
    _widht = widht;
    
    CGRect myFrame = (CGRectMake(self.view.frame.size.width - 20.0f, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    UIView *myView = [[UIView alloc]initWithFrame:myFrame];
    myView.backgroundColor = [UIColor orangeColor];
    // Get center of  our view. We'll need it later
    _rightCenter = myView.center;
    // Calculate start position of a new center - where we move if drag is > 100 points
    _leftCenter = CGPointMake(_rightCenter.x - _widht+20, _rightCenter.y);
    
    self.isOpen = NO;
    [self.view addSubview:myView];
    
    UIScreenEdgePanGestureRecognizer *edgeRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDragged:)];
    edgeRecognizer.edges = UIRectEdgeRight;
    [myView addGestureRecognizer:edgeRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDragged:)];
    [myView addGestureRecognizer:panRecognizer];
}

-(void)viewDragged: (UIScreenEdgePanGestureRecognizer *) sender {
    
    CGPoint translationInView = [sender translationInView: self.view];
    // Calculate position of new center according to drag
    CGPoint newPosition;
    CGPoint src;
    CGPoint dst;
    // moving left <- translationInView.x is  negative
    if (translationInView.x < 0){
        src = _rightCenter;
        dst = _leftCenter;
        // moving right -> translationInView.x is  positive
    }else{
        src = _leftCenter;
        dst = _rightCenter;
    }
    
    // calculate position of a center depends on direction
    newPosition = CGPointMake(src.x + translationInView.x, src.y);
    // distance is just absolute value of dragged distance, so we use fabs to get always positive number
    CGFloat distance = fabs(translationInView.x);
    
    switch (sender.state) {
            
        case UIGestureRecognizerStateChanged:
            // Changing coordinates to a new center
            sender.view.center = newPosition;
            //NSLog(@"UIGestureRecognizerStateChanged");
            break;
            
        case UIGestureRecognizerStateEnded:
            NSLog(@"UIGestureRecognizerStateEnded");
            // Check if we moved box more than 100 points
            if(distance > 100){
                NSLog(@"I'll move you to a new position");
                // Move to a new position
                sender.view.center = dst;
            }
            else{
                // We moved box less than 100 points - return to Original position
                NSLog(@"Get back");
                sender.view.center = src;
            }
            break;
        case UIGestureRecognizerStatePossible:
            NSLog(@"UIGestureRecognizerStatePossible");
            break;
        case UIGestureRecognizerStateBegan:
            NSLog(@"UIGestureRecognizerStateBegan");
            break;
        case UIGestureRecognizerStateCancelled:
            NSLog(@"UIGestureRecognizerStateCancelled");
            break;
        case UIGestureRecognizerStateFailed:
            NSLog(@"UIGestureRecognizerStateFailed");
            break;
    }
}



-(void)dragViewBack: (UIPanGestureRecognizer *) sender {
    NSLog(@"back....");
}

@end
