//
//  VC4.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC4.h"

/*
 * Layer上的动画->显式增加的普通方式:
 */

@interface VC4 ()
{
  CALayer *pulseLayer_;
}

@property (strong, nonatomic) IBOutlet UIImageView *vPlane;


- (IBAction)didPlay:(id)sender;


@end

@implementation VC4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)didPlay:(id)sender {
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = .5;
    pulseAnimation.toValue = [NSNumber numberWithFloat:1.1];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = FLT_MAX;
    [self.vPlane.layer addAnimation:pulseAnimation forKey:@"animateScale"];
    
    CABasicAnimation *opAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opAnim.duration = 3.0;
    opAnim.fromValue = [NSNumber numberWithFloat:.25];
    opAnim.toValue= [NSNumber numberWithFloat:1.0];
    opAnim.cumulative = YES;
    opAnim.repeatCount = 2;
    opAnim.fillMode = kCAFillModeForwards;
    opAnim.removedOnCompletion = NO;
    [self.vPlane.layer addAnimation:opAnim forKey:@"animateOpacity"];
    
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(180, 200);
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    moveAnim.duration = 6.0;
    moveAnim.toValue= [NSValue valueWithCATransform3D:
                       CATransform3DMakeAffineTransform(moveTransform)];
    moveAnim.fillMode = kCAFillModeForwards;
    moveAnim.removedOnCompletion = NO;
    opAnim.repeatCount = 2;
    [self.vPlane.layer addAnimation:moveAnim forKey:@"animateTransform"];
}
@end
