//
//  VC2.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC2.h"

/*
 * UIView上的动画->通过块方式：
 */

@interface VC2 ()
{
    int flag;
}
@property (strong, nonatomic) UIImageView *viewAnim;
@property (weak, nonatomic) IBOutlet UILabel *labelAnim;



- (IBAction)didPlay:(id)sender;

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    flag = 1;
    self.viewAnim = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ball.png"]];
    CGRect frame = self.viewAnim.frame;
    self.viewAnim.frame = CGRectMake(100, 100, frame.size.width, frame.size.height);
    [self.view addSubview:self.viewAnim];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)didPlay:(id)sender {

    self.labelAnim.text = @"animation start";
    
    [UIView animateWithDuration:1.5 animations:^{
        CGRect frame = self.viewAnim.frame;
        frame.origin.y += 100*flag;
        self.viewAnim.frame = frame;
        flag *= -1;
        self.viewAnim.alpha = 0.2;
    }completion:^(BOOL finished) {
        if (finished) {
            self.viewAnim.alpha = 1.0;
            self.labelAnim.text = @"animation stop";
        }
    }];
}


@end
