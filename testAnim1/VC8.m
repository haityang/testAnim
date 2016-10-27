//
//  VC8.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

/*
 * Layer上的动画->渐变动画
 */

#import "VC8.h"

@interface VC8 ()
{
    CALayer *containerLayer_;
    CALayer *blueLayer_;
    CALayer *redLayer_;
    int index_;
}

- (IBAction)didPlay:(id)sender;

@end

@implementation VC8

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    blueLayer_ = [CALayer layer];
    redLayer_ = [CALayer layer];
    containerLayer_ = [CALayer layer];
    
    [self.view.layer addSublayer:containerLayer_];
    [containerLayer_ addSublayer:blueLayer_];
    [containerLayer_ addSublayer:redLayer_];
    
    CGRect rect = CGRectMake(0., 0., 240., 240.);
    
    containerLayer_.backgroundColor = [[UIColor clearColor] CGColor];
    containerLayer_.bounds = rect;
    containerLayer_.position = CGPointMake(160., 280.);
    [containerLayer_ setNeedsDisplay];
    
    redLayer_.backgroundColor = [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:.75] CGColor];
    redLayer_.bounds = rect;
    redLayer_.position = CGPointMake(120., 120.);
    redLayer_.hidden = YES;
    [redLayer_ setNeedsDisplay];
    
    blueLayer_.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:1.0 alpha:.75] CGColor];
    blueLayer_.bounds = rect;
    blueLayer_.position = CGPointMake(120., 120.);
    [blueLayer_ setNeedsDisplay];
    
    index_ = 0;
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
    CATransition *transition = [CATransition animation];
    transition.duration = .5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    NSString *transitionTypes[4] = { kCATransitionPush, kCATransitionMoveIn, kCATransitionReveal, kCATransitionFade };
    transition.type = transitionTypes[index_];
    
    NSString *transitionSubtypes[4] = { kCATransitionFromRight, kCATransitionFromLeft, kCATransitionFromTop, kCATransitionFromBottom };
    transition.subtype = transitionSubtypes[index_];
    
    [containerLayer_ addAnimation:transition forKey:nil];
    blueLayer_.hidden = !blueLayer_.hidden;
    redLayer_.hidden = !redLayer_.hidden;
    index_ = (index_+1)%4;
}
@end
