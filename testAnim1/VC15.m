//
//  VC15.m
//  testAnim1
//
//  Created by yht on 4/20/15.
//  Copyright (c) 2015 yht. All rights reserved.
//

#import "VC15.h"

@interface VC15 ()<UICollisionBehaviorDelegate>
{
    BOOL _firstContact;
}

@property (weak, nonatomic) IBOutlet UIImageView *box;

@property (nonatomic,strong) UIDynamicAnimator* animator;
@property (nonatomic,strong) UISnapBehavior *snap;

- (IBAction)handleSnapGesture:(UITapGestureRecognizer*)gesture;
@end

@implementation VC15

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"甩行为";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
}

- (IBAction)handleSnapGesture:(UITapGestureRecognizer*)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    
    // 移除甩行为
    [_animator removeBehavior:_snap];
    
    _snap = [[UISnapBehavior alloc] initWithItem:_box snapToPoint:point];
    [self.animator addBehavior:_snap];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
