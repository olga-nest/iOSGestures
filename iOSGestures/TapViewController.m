#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat height = 100;
    CGFloat widht  = 100;
    
    CGRect frame = (CGRectMake(CGRectGetMidX(self.view.bounds) - widht/2, (CGRectGetMidY(self.view.bounds) - height/2), widht, height));
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor yellowColor];;
    [self.view addSubview:view];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeColor:)];
    [view addGestureRecognizer:tapRecognizer];    
}

-(void)changeColor: (UITapGestureRecognizer *) sender {
    UIColor *color = [sender.view.backgroundColor isEqual: [UIColor yellowColor]] ? [UIColor orangeColor] : [UIColor yellowColor];
    
    sender.view.backgroundColor = color;
    
}
@end
