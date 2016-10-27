//
//  VC1.m
//  testAnim1
//
//  Created by yht on 4/10/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC1.h"

/*
 * UIView上的动画->通过显式调用的方式：
 */

@interface VC1 ()
{
    int flag;
}
@property (strong, nonatomic) UIImageView *viewAnim;
@property (weak, nonatomic) IBOutlet UILabel *labelAnim;



- (IBAction)didPlay:(id)sender;

@end

@implementation VC1

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didPlay:(id)sender {
    
    [UIView beginAnimations:@"anim1" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(setAnimBegin:)];
    [UIView setAnimationDidStopSelector:@selector(setAnimEnd:)];
    CGRect frame = self.viewAnim.frame;
    frame.origin.y += 100 *flag;
    flag *= -1;
    self.viewAnim.frame = frame;
    [UIView commitAnimations];
}

- (void)setAnimBegin:(id)sender
{
    self.labelAnim.text = @"animation will start";
}

- (void)setAnimEnd:(id)sender
{
    self.labelAnim.text = @"animation did end";
}

@end
