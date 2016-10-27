//
//  VC6.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

/*
 Layer上的动画->关键桢动画->通过path的方式增加动画：
 */

#import "VC6.h"

static const CGRect kMarioStandingSpriteCoords = { .5, 0., .5, 1. };
static const CGRect kMarioJumpingSpriteCoords = { 0., 0., .5, 1. };

@interface VC6 ()
{
    CALayer *platformLayer_;
    CALayer *marioLayer_;
}



- (IBAction)didPlay:(id)sender;

@end

@implementation VC6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    platformLayer_ = [CALayer layer];
    marioLayer_ = [CALayer layer];
    
    [self.view.layer addSublayer:platformLayer_];
    [self.view.layer addSublayer:marioLayer_];
    
    CGSize viewSize = self.view.bounds.size;
    
    marioLayer_.backgroundColor = [[UIColor clearColor] CGColor];
    marioLayer_.anchorPoint = CGPointMake(0., 1.);
    marioLayer_.bounds = CGRectMake(0., 0., 32., 64.);
    marioLayer_.position = CGPointMake(0., viewSize.height);
    marioLayer_.contents = (id)[[UIImage imageNamed:@"Mario.png"] CGImage];
    marioLayer_.contentsGravity = kCAGravityResizeAspect;
    marioLayer_.contentsRect = kMarioStandingSpriteCoords;
    
    platformLayer_.backgroundColor = [[UIColor brownColor] CGColor];
    platformLayer_.anchorPoint = CGPointZero;
    platformLayer_.frame = CGRectMake(160., 200., 160., 20.);
    platformLayer_.cornerRadius = 4.;
    [platformLayer_ setNeedsDisplay];
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
    CGSize viewSize = self.view.bounds.size;
    [marioLayer_ removeAnimationForKey:@"marioJump"];
    
    CGMutablePathRef jumpPath = CGPathCreateMutable();
    CGPathMoveToPoint(jumpPath, NULL, 0., viewSize.height);
    CGPathAddCurveToPoint(jumpPath, NULL, 30., 140., 170., 140., 170., 200.);
    
    CAKeyframeAnimation *jumpAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    jumpAnimation.path = jumpPath;
    jumpAnimation.duration = 1.;
    jumpAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    jumpAnimation.delegate = self;
    
    CGPathRelease(jumpPath);
    
    [marioLayer_ addAnimation:jumpAnimation forKey:@"marioJump"];
}


#pragma mark Animation delegate methods

- (void)animationDidStart:(CAAnimation *)theAnimation {
    [CATransaction begin];
    {
        [CATransaction setDisableActions:YES];
        marioLayer_.contentsRect = kMarioJumpingSpriteCoords;
    }
    [CATransaction commit];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished {
    [CATransaction begin];
    {
        [CATransaction setDisableActions:YES];
        marioLayer_.contentsRect = kMarioStandingSpriteCoords;
        if(finished) {
            marioLayer_.position = CGPointMake(170., 200.);
        }
    }
    [CATransaction commit];
}
@end
