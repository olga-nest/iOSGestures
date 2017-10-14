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



@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat height = 300;
    CGFloat widht  = 300;
    
    CGRect myFrame = (CGRectMake(self.view.frame.size.width - 20.0f, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *myView = [[UIView alloc]initWithFrame:myFrame];
    myView.backgroundColor = [UIColor orangeColor];
    self.isOpen = NO;
    [self.view addSubview:myView];
    
    UIScreenEdgePanGestureRecognizer *edgeRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDragged:)];
    edgeRecognizer.edges = UIRectEdgeRight;
    [myView addGestureRecognizer:edgeRecognizer];
    
//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDragged:)];
//    [myView addGestureRecognizer:panRecognizer];
}

-(void)viewDragged: (UIScreenEdgePanGestureRecognizer *) sender {
    NSLog(@"drag....");
    CGPoint translationInView = [sender translationInView: self.view];
    CGPoint originalEdgeX = sender.view.center;
    CGPoint newEdgeX = CGPointMake(originalEdgeX.x + translationInView.x, originalEdgeX.y);
    
    
    switch (sender.state) {
        case UIGestureRecognizerStateChanged: {

        sender.view.center = newEdgeX;
            
            //create stop Xpoint?
            if (originalEdgeX.x + translationInView.x < sender.view.frame.origin.x + 100) {
                sender.view.frame = self.myFrame;
            }
            break; }
        case UIGestureRecognizerStateEnded:
            if (originalEdgeX.x < self.view.center.x) {
                sender.view.frame = self.myFrame; }
      //  case UIGestureRecognizerStateCancelled:
    }
}
    


-(void)dragViewBack: (UIPanGestureRecognizer *) sender {
    NSLog(@"back....");
}

@end

