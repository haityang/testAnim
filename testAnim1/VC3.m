//
//  VC3.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC3.h"

/*
 * UIView上的动画->普通提交方式过渡动画
 */

@interface VC3 ()
{

}

- (IBAction)didPlay:(id)sender;




@end

@implementation VC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didPlay:(id)sender {
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    UIButton *theButton = (UIButton *)sender;
    switch (theButton.tag) {
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            break;
        case 2:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
            break;
        case 3:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
            break;
        case 4:
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
            break;
        default:
            break;
    }
    [UIView commitAnimations];
}
@end
