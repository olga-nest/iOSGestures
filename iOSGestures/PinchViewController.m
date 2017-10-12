#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat height = 100;
    CGFloat widht  = 100;
    
    CGRect frame = (CGRectMake(CGRectGetMidX(self.view.bounds) - widht/2, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(viewPinched:)];
    [view addGestureRecognizer:pinchRecognizer];


}

-(void)viewPinched:(UIPinchGestureRecognizer *)sender {
    CGFloat scale = sender.scale;
    
    sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    
    scale = 1.0;
}



@end
