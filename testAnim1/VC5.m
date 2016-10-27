//
//  VC5.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC5.h"

/*
 * Layer上的动画->关键桢动画->通过普通方式
 */

@interface VC5 ()
@property (strong, nonatomic) IBOutlet UIImageView *vPlane;


- (IBAction)didPlay:(id)sender;
@end

@implementation VC5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.vPlane.layer.opacity = 0.25;
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
    CAKeyframeAnimation *opAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opAnim.duration = 6.0;
    opAnim.values =[NSArray arrayWithObjects:
                    [NSNumber numberWithFloat:0.25],
                    [NSNumber numberWithFloat:0.75],
                    [NSNumber numberWithFloat:1.0],
                    nil];
    opAnim.keyTimes = [NSArray arrayWithObjects:
                       [NSNumber numberWithFloat:0.0],
                       [NSNumber numberWithFloat:0.5],
                       [NSNumber numberWithFloat:1.0], nil];
    
    opAnim.fillMode = kCAFillModeForwards;
    opAnim.removedOnCompletion = NO;
    [_vPlane.layer addAnimation:opAnim forKey:@"animateOpacity"];
    
    
    
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(180, 200);
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    moveAnim.duration = 6.0;
    moveAnim.toValue= [NSValue valueWithCATransform3D:
                       CATransform3DMakeAffineTransform(moveTransform)];
    
    moveAnim.fillMode = kCAFillModeForwards;
    moveAnim.removedOnCompletion = NO;
    [_vPlane.layer addAnimation:moveAnim forKey:@"animateTransform"];
}
@end
