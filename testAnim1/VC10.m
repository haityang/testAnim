//
//  VC10.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC10.h"
#import "HUTransitionAnimator.h"

/*
 * ViewController切换时的动画->模态切换
 */

@interface VC10 ()<UIViewControllerTransitioningDelegate>
- (IBAction)didPush:(id)sender;

@end

@implementation VC10

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.transitioningDelegate = self;
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
    UIViewController* destinationViewController = [segue destinationViewController];
    destinationViewController.transitioningDelegate = self;

}

- (IBAction)didPush:(id)sender {
    [self performSegueWithIdentifier:@"VC101" sender:self];// @"模态切换"
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    id transitioning = [[HUTransitionVerticalLinesAnimator alloc] init];
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    id transitioning = [[HUTransitionHorizontalLinesAnimator alloc] init];
    return transitioning;
}
@end
