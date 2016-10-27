//
//  VC7.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC7.h"

/*
 * Layer上的动画->动画组，可以使多个动画同时运行
 */

@interface VC7 ()
{
    CALayer *pulseLayer_;
}


- (IBAction)didPlay:(id)sender;

@end

@implementation VC7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pulseLayer_ = [CALayer layer];
    [self.view.layer addSublayer:pulseLayer_];
    
    pulseLayer_.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:.75] CGColor];
    pulseLayer_.bounds = CGRectMake(0., 0., 200., 200.);
    pulseLayer_.cornerRadius = 12.;
    pulseLayer_.position = self.view.center;
    [pulseLayer_ setNeedsDisplay];
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
    pulseAnimation.duration = 2.;
    pulseAnimation.toValue = [NSNumber numberWithFloat:1.15];
    
    CABasicAnimation *pulseColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    pulseColorAnimation.duration = 1.;
    pulseColorAnimation.fillMode = kCAFillModeForwards;
    pulseColorAnimation.toValue = (id)[[UIColor colorWithRed:1.0 green:0 blue:0 alpha:.75] CGColor];
    
    CABasicAnimation *rotateLayerAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateLayerAnimation.duration = .5;
    rotateLayerAnimation.beginTime = .5;
    rotateLayerAnimation.fillMode = kCAFillModeBoth;
    rotateLayerAnimation.toValue = [NSNumber numberWithFloat:(45. * M_PI / 180)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:pulseAnimation, pulseColorAnimation, rotateLayerAnimation, nil];
    group.duration = 2.;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.autoreverses = YES;
    group.repeatCount = FLT_MAX;
    
    [pulseLayer_ addAnimation:group forKey:nil];
}
@end
