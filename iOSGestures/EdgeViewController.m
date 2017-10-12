//
//  EdgeViewController.m
//  iOSGestures
//
//  Created by Olga on 10/12/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat height = 300;
    CGFloat widht  = 300;
    
    CGRect frame = (CGRectMake(self.view.frame.size.width - 20.0f, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *myView = [[UIView alloc]initWithFrame:frame];
    myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:myView];
    
    UIScreenEdgePanGestureRecognizer *edgeRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(viewDragged:)];
    [edgeRecognizer setEdges:UIRectEdgeRight];
    [myView addGestureRecognizer:edgeRecognizer];
}

-(void)viewDragged: (UIScreenEdgePanGestureRecognizer *) sender {
    NSLog(@"Edge...");
    
   
    
}


@end

