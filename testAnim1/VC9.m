//
//  VC9.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//
/*
 * ViewController切换时的动画->普通切换
 */

#import "VC9.h"
#import "HUTransitionAnimator.h"

typedef NS_ENUM(NSInteger, HUTransitionType) {
    Transition6Style,
    TransitionGhost,
    TransitionVerticalLines,
    TransitionHorizontalLines,
};

@interface VC9 ()<UINavigationControllerDelegate>
@property HUTransitionType transitionType;
@end

@implementation VC9

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"TransitionGhost"]) {
        self.transitionType = TransitionGhost;
    } else if ([[segue identifier] isEqualToString:@"TransitionVerticalLines"]) {
        self.transitionType = TransitionVerticalLines;
    }  else if ([[segue identifier] isEqualToString:@"TransitionHorizontalLines"]) {
        self.transitionType = TransitionHorizontalLines;
    }  else if ([[segue identifier] isEqualToString:@"Transition6Style"]) {
        self.transitionType = Transition6Style;
    }
}


#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    HUTransitionAnimator *animator;
    
    switch (self.transitionType) {
        case TransitionGhost:
            animator = [[HUTransitionGhostAnimator alloc] init];
            break;
        case TransitionVerticalLines:
            animator = [[HUTransitionVerticalLinesAnimator alloc] init];
            break;
        case TransitionHorizontalLines:
            animator = [[HUTransitionHorizontalLinesAnimator alloc] init];
            break;
        default:
            animator = [[HUTransitionAnimator alloc] init];
            break;
    }
    animator.presenting = (operation == UINavigationControllerOperationPop)?NO:YES;
    return animator;
    
}


@end
