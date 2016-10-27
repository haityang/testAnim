//
//  VC31.m
//  testAnim1
//
//  Created by yht on 4/17/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC31.h"

/*
 专门函数的过渡动画
 */

@interface VC31 ()

- (IBAction)didPlay:(id)sender;
@end

@implementation VC31

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
    UIButton *theButton = (UIButton *)sender;
    switch (theButton.tag) {
        case 1:
            [UIView transitionWithView:self.view duration:3.0f
                               options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionFlipFromLeft
                            animations:NULL completion:NULL];
            break;
        case 2:
            [UIView transitionWithView:self.view duration:3.0f
                               options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionFlipFromRight
                            animations:NULL completion:NULL];
            break;
        case 3:
            [UIView transitionWithView:self.view duration:3.0f
                               options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionCurlUp
                            animations:NULL completion:NULL];
            break;
        case 4:
            [UIView transitionWithView:self.view duration:3.0f
                               options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionCurlDown
                            animations:NULL completion:NULL];
            break;
    }
}
@end
