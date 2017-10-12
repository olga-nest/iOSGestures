#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController
- (IBAction)pinkViewPanned:(UIPanGestureRecognizer *)sender {
    
    CGPoint locationInView = [sender locationInView:self.view];
    sender.view.center = locationInView;
}

@end
